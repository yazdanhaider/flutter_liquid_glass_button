import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class GlassSquareCard extends StatelessWidget {
  const GlassSquareCard({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return LiquidGlass(
      shape: const LiquidRoundedRectangle(borderRadius: Radius.circular(16)),
      settings: const LiquidGlassSettings(
        blur: 8,
        thickness: 12,
        glassColor: Color(0x22FFFFFF),
      ),
      glassContainsChild: false,
      child: SizedBox(
        width: 160,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(IconsaxPlusLinear.image, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
