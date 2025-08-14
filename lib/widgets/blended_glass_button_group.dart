import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class BlendedGlassButtonGroup extends StatelessWidget {
  const BlendedGlassButtonGroup({
    super.key,
    required this.children,
    this.settings = const LiquidGlassSettings(
      thickness: 14,
      blur: 6,
      glassColor: Color(0x22FFFFFF),
      lightIntensity: 1.2,
      blend: 48,
    ),
    this.spacing = 12,
    this.runSpacing = 12,
    this.alignment = WrapAlignment.center,
    this.direction = Axis.horizontal,
    this.padding,
  });

  final List<Widget> children;
  final LiquidGlassSettings settings;
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;
  final Axis direction;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final content = Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      direction: direction,
      children: children,
    );

    final padded = padding == null
        ? content
        : Padding(padding: padding!, child: content);

    return LiquidGlassLayer(settings: settings, child: padded);
  }
}
