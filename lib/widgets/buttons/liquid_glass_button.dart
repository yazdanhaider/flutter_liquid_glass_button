import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class LiquidGlassButton extends StatefulWidget {
  const LiquidGlassButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.borderRadius = 28,
    this.blur = 8,
    this.glassContainsChild = false,
    this.settings,
    this.isLoading = false,
    this.isDisabled = false,
    this.minSize = const Size(64, 44),
    this.inLayer = false,
    this.border,
    this.foregroundColor,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double blur;
  final bool glassContainsChild;
  final LiquidGlassSettings? settings;
  final bool isLoading;
  final bool isDisabled;
  final Size minSize;
  final bool inLayer;
  final BorderSide? border;
  final Color? foregroundColor;

  @override
  State<LiquidGlassButton> createState() => _LiquidGlassButtonState();
}

class _LiquidGlassButtonState extends State<LiquidGlassButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressController;
  late final Animation<double> _scale;

  bool get _enabled =>
      !widget.isDisabled && !widget.isLoading && widget.onPressed != null;

  bool _hovered = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(CurvedAnimation(parent: _pressController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails _) {
    if (_enabled) _pressController.forward();
  }

  void _handleTapCancel() {
    if (_enabled) _pressController.reverse();
  }

  void _handleTapUp(TapUpDetails _) {
    if (_enabled) _pressController.reverse();
  }

  LiquidGlassSettings _resolveSettings(BuildContext context) {
    final disabled = !_enabled;
    final base =
        widget.settings ??
        const LiquidGlassSettings(
          thickness: 12,
          glassColor: Color(0x22FFFFFF),
          lightIntensity: 1.2,
          blend: 36,
          saturation: 1.0,
          lightness: 1.0,
        );
    final t = _pressController.value;
    final hoverBoost = _hovered ? 0.2 : 0.0;
    final focusBoost = _focused ? 0.1 : 0.0;
    var s = base.copyWith(
      blur: widget.blur,
      lightIntensity:
          base.lightIntensity * (1 + hoverBoost + focusBoost + 0.12 * t),
      thickness: base.thickness * (1 + 0.10 * t),
    );
    if (!disabled) return s;
    final c = s.glassColor;
    final faded = c.withValues(alpha: c.a * 0.7);
    return s.copyWith(
      lightIntensity: s.lightIntensity * 0.7,
      glassColor: faded,
    );
  }

  @override
  Widget build(BuildContext context) {
    final shape = LiquidRoundedSuperellipse(
      borderRadius: Radius.circular(widget.borderRadius),
    );
    final resolved = _resolveSettings(context);
    final content = ScaleTransition(
      scale: _scale,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: widget.minSize.width,
          minHeight: widget.minSize.height,
        ),
        child: Padding(
          padding: widget.padding,
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color:
                  widget.foregroundColor ??
                  (widget.glassContainsChild ? Colors.black : Colors.white),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: widget.isLoading
                  ? SizedBox(
                      key: const ValueKey('loading'),
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                  : IconTheme.merge(
                      key: const ValueKey('content'),
                      data: IconThemeData(
                        color:
                            widget.foregroundColor ??
                            (widget.glassContainsChild
                                ? Colors.black
                                : Colors.white),
                      ),
                      child: widget.child,
                    ),
            ),
          ),
        ),
      ),
    );

    final glass = widget.inLayer
        ? LiquidGlass.inLayer(
            shape: shape,
            glassContainsChild: widget.glassContainsChild,
            child: content,
          )
        : LiquidGlass(
            shape: shape,
            settings: resolved,
            glassContainsChild: widget.glassContainsChild,
            child: content,
          );

    final outlined = widget.border == null
        ? glass
        : Stack(
            alignment: Alignment.center,
            children: [
              glass,
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: LiquidRoundedSuperellipse(
                        borderRadius: Radius.circular(widget.borderRadius),
                        side: widget.border!,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );

    return FocusableActionDetector(
      onShowHoverHighlight: (v) => setState(() => _hovered = v),
      onShowFocusHighlight: (v) => setState(() => _focused = v),
      child: MouseRegion(
        cursor: _enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTapDown: _enabled ? _handleTapDown : null,
          onTapCancel: _enabled ? _handleTapCancel : null,
          onTapUp: _enabled ? _handleTapUp : null,
          onTap: _enabled ? widget.onPressed : null,
          behavior: HitTestBehavior.opaque,
          child: AnimatedBuilder(
            animation: _pressController,
            builder: (context, _) =>
                Opacity(opacity: _enabled ? 1 : 0.6, child: outlined),
          ),
        ),
      ),
    );
  }
}
