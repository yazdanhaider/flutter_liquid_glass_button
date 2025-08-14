import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    this.height,
    this.width,
    required this.borderRadius,
    required this.settings,
    required this.child,
    this.glassContainsChild = false,
  });

  final double? height;
  final double? width;
  final double borderRadius;
  final LiquidGlassSettings settings;
  final bool glassContainsChild;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(
          borderRadius: Radius.circular(borderRadius),
        ),
        settings: settings,
        glassContainsChild: glassContainsChild,
        child: SizedBox(
          height: height,
          width: width ?? double.infinity,
          child: child,
        ),
      ),
    );
  }
}
