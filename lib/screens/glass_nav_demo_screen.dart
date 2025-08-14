import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../widgets/blended_glass_button_group.dart';
import '../widgets/buttons/liquid_glass_button.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_tile.dart';
import '../widgets/glass/glass_square_card.dart';

class GlassNavDemoScreen extends StatefulWidget {
  const GlassNavDemoScreen({super.key});

  @override
  State<GlassNavDemoScreen> createState() => _GlassNavDemoScreenState();
}

class _GlassNavDemoScreenState extends State<GlassNavDemoScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  void _goTo(int i) {
    setState(() => _index = i);
    _controller.animateToPage(
      i,
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0F2027),
                    Color(0xFF203A43),
                    Color(0xFF2C5364),
                  ],
                ),
              ),
            ),
          ),
          PageView(
            controller: _controller,
            onPageChanged: (i) => setState(() => _index = i),
            children: const [
              _HomeView(),
              _SearchView(),
              _LikesView(),
              _ProfileView(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: BlendedGlassButtonGroup(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  settings: const LiquidGlassSettings(
                    blend: 56,
                    blur: 8,
                    thickness: 12,
                    glassColor: Color(0x22FFFFFF),
                    lightIntensity: 1.2,
                  ),
                  children: [
                    LiquidGlassButton(
                      inLayer: true,
                      onPressed: () => _goTo(0),
                      borderRadius: 22,
                      glassContainsChild: false,
                      settings: _index == 0
                          ? const LiquidGlassSettings(
                              thickness: 16,
                              blur: 8,
                              glassColor: Color(0x33FFFFFF),
                            )
                          : const LiquidGlassSettings(
                              thickness: 10,
                              blur: 6,
                              glassColor: Color(0x22FFFFFF),
                            ),
                      foregroundColor: _index == 0
                          ? Colors.white
                          : Colors.white70,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(IconsaxPlusLinear.home_1, size: 18),
                          SizedBox(width: 6),
                          Text('Home'),
                        ],
                      ),
                    ),
                    LiquidGlassButton(
                      inLayer: true,
                      onPressed: () => _goTo(1),
                      borderRadius: 22,
                      glassContainsChild: false,
                      settings: _index == 1
                          ? const LiquidGlassSettings(
                              thickness: 16,
                              blur: 8,
                              glassColor: Color(0x33FFFFFF),
                            )
                          : const LiquidGlassSettings(
                              thickness: 10,
                              blur: 6,
                              glassColor: Color(0x22FFFFFF),
                            ),
                      foregroundColor: _index == 1
                          ? Colors.white
                          : Colors.white70,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(IconsaxPlusLinear.search_normal, size: 18),
                          SizedBox(width: 6),
                          Text('Search'),
                        ],
                      ),
                    ),
                    LiquidGlassButton(
                      inLayer: true,
                      onPressed: () => _goTo(2),
                      borderRadius: 22,
                      glassContainsChild: false,
                      settings: _index == 2
                          ? const LiquidGlassSettings(
                              thickness: 16,
                              blur: 8,
                              glassColor: Color(0x33FFFFFF),
                            )
                          : const LiquidGlassSettings(
                              thickness: 10,
                              blur: 6,
                              glassColor: Color(0x22FFFFFF),
                            ),
                      foregroundColor: _index == 2
                          ? Colors.white
                          : Colors.white70,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(IconsaxPlusLinear.heart, size: 18),
                          SizedBox(width: 6),
                          Text('Likes'),
                        ],
                      ),
                    ),
                    LiquidGlassButton(
                      inLayer: true,
                      onPressed: () => _goTo(3),
                      borderRadius: 22,
                      glassContainsChild: false,
                      settings: _index == 3
                          ? const LiquidGlassSettings(
                              thickness: 16,
                              blur: 8,
                              glassColor: Color(0x33FFFFFF),
                            )
                          : const LiquidGlassSettings(
                              thickness: 10,
                              blur: 6,
                              glassColor: Color(0x22FFFFFF),
                            ),
                      foregroundColor: _index == 3
                          ? Colors.white
                          : Colors.white70,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(IconsaxPlusLinear.user, size: 18),
                          SizedBox(width: 6),
                          Text('Profile'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GlassPanel(
            height: 180,
            borderRadius: 28,
            settings: const LiquidGlassSettings(
              thickness: 14,
              blur: 8,
              glassColor: Color(0x33FFFFFF),
              lightIntensity: 1.3,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Experience Flutter liquid glass UI',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          LiquidGlassLayer(
            settings: const LiquidGlassSettings(
              thickness: 12,
              blur: 6,
              glassColor: Color(0x22FFFFFF),
              blend: 40,
              lightIntensity: 1.2,
            ),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                GlassTile(label: 'Music', icon: IconsaxPlusLinear.music),
                GlassTile(label: 'Photos', icon: IconsaxPlusLinear.image),
                GlassTile(label: 'Files', icon: IconsaxPlusLinear.folder),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GlassPanel(
            height: 56,
            borderRadius: 22,
            settings: const LiquidGlassSettings(
              blur: 8,
              thickness: 10,
              glassColor: Color(0x22FFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(
                    IconsaxPlusLinear.search_normal,
                    color: Colors.white70,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Search anything',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          BlendedGlassButtonGroup(
            settings: const LiquidGlassSettings(
              thickness: 12,
              blur: 6,
              glassColor: Color(0x22FFFFFF),
              blend: 48,
            ),
            children: const [
              _ChipButton(label: 'All', icon: IconsaxPlusLinear.category),
              _ChipButton(label: 'Images', icon: IconsaxPlusLinear.image),
              _ChipButton(label: 'Videos', icon: IconsaxPlusLinear.video),
              _ChipButton(label: 'Docs', icon: IconsaxPlusLinear.document),
            ],
          ),
        ],
      ),
    );
  }
}

class _LikesView extends StatelessWidget {
  const _LikesView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: const [
              GlassSquareCard(label: 'Sunset'),
              GlassSquareCard(label: 'Mountains'),
            ],
          ),
          const SizedBox(height: 16),
          GlassPanel(
            height: 120,
            borderRadius: 24,
            settings: const LiquidGlassSettings(
              blur: 6,
              thickness: 12,
              glassColor: Color(0x22FFFFFF),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(IconsaxPlusLinear.heart, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Text(
                    'Your favorites',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 120),
      child: Column(
        children: [
          Center(
            child: LiquidGlass(
              shape: const LiquidOval(),
              settings: const LiquidGlassSettings(
                blur: 8,
                thickness: 14,
                glassColor: Color(0x33FFFFFF),
              ),
              glassContainsChild: false,
              child: const SizedBox(
                height: 110,
                width: 110,
                child: Center(
                  child: Icon(Icons.person, color: Colors.white, size: 48),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GlassPanel(
            height: 56,
            borderRadius: 20,
            settings: const LiquidGlassSettings(
              blur: 6,
              thickness: 10,
              glassColor: Color(0x22FFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(
                    IconsaxPlusLinear.setting_2,
                    color: Colors.white70,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Settings',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Icon(
                    IconsaxPlusLinear.arrow_right_3,
                    color: Colors.white70,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          GlassPanel(
            height: 56,
            borderRadius: 20,
            settings: const LiquidGlassSettings(
              blur: 6,
              thickness: 10,
              glassColor: Color(0x22FFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(IconsaxPlusLinear.lock, color: Colors.white70, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Privacy',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Icon(
                    IconsaxPlusLinear.arrow_right_3,
                    color: Colors.white70,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipButton extends StatelessWidget {
  const _ChipButton({required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return LiquidGlassButton(
      inLayer: true,
      onPressed: () {},
      borderRadius: 20,
      glassContainsChild: false,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 16), const SizedBox(width: 6), Text(label)],
      ),
    );
  }
}
