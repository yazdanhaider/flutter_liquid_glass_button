# Liquid Glass Button Flutter App

A beautiful Flutter application showcasing modern liquid glass UI components with stunning visual effects and smooth animations. This project demonstrates how to create elegant glassmorphism interfaces using the `liquid_glass_renderer` package, **inspired by iOS liquid glass design**.

<img width="1920" height="1080" alt="1" src="https://github.com/user-attachments/assets/bb995695-a53b-4e62-8baa-8a49bfc20961" />

## 🍎 iOS Liquid Glass Inspiration

This project draws inspiration from Apple's signature liquid glass aesthetic found in iOS interfaces, featuring:

- **Translucent glass effects** similar to iOS Control Center and Notification Center
- **Smooth blur and transparency** matching iOS design principles
- **Subtle light reflections** that mimic iOS glass surfaces
- **Elegant animations** inspired by iOS fluid interactions
- **Modern glassmorphism** that feels native to Apple's design ecosystem

## 🌟 Features

- **Liquid Glass Navigation Bar** - Animated bottom navigation with glass effects
- **Interactive Glass Buttons** - Press animations with hover and focus states
- **Glass Panels & Cards** - Various glass UI components for content display
- **Blended Glass Groups** - Layered glass effects for grouped elements
- **Responsive Design** - Works across different screen sizes
- **Smooth Animations** - Fluid transitions and micro-interactions

## 📱 Screenshots

The app includes four main screens:

<img width="1920" height="1080" alt="2" src="https://github.com/user-attachments/assets/bfcdc83a-001d-4494-b88e-3c1f18241b23" />

- **Home** - Welcome panel with glass tiles for different categories
- **Search** - Search bar with filter chips
- **Likes** - Favorites display with glass cards
- **Profile** - User profile with settings panels

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point
├── screens/
│   └── glass_nav_demo_screen.dart     # Main demo screen with navigation
└── widgets/
    ├── blended_glass_button_group.dart # Glass button group container
    ├── buttons/
    │   └── liquid_glass_button.dart   # Main glass button component
    └── glass/
        ├── glass_panel.dart           # Glass panel container
        ├── glass_square_card.dart     # Square glass card
        └── glass_tile.dart            # Small glass tile
```

## 🎨 Core Components

### LiquidGlassButton

A highly customizable glass button with:

- Press animations and scaling effects
- Hover and focus states
- Loading and disabled states
- Customizable glass settings
- Border support
- Foreground color customization

```dart
LiquidGlassButton(
  onPressed: () => print('Pressed!'),
  borderRadius: 28,
  settings: LiquidGlassSettings(
    thickness: 12,
    blur: 8,
    glassColor: Color(0x22FFFFFF),
  ),
  child: Text('Glass Button'),
)
```

### BlendedGlassButtonGroup

A container that groups multiple glass buttons with shared glass effects:

- Automatic spacing and alignment
- Layered glass rendering
- Customizable blend settings
- Responsive layout

### GlassPanel

A versatile glass container for content:

- Customizable dimensions
- Rounded corners
- Glass effect settings
- Child content support

### GlassSquareCard & GlassTile

Specialized glass components for displaying content:

- Pre-configured sizes and styles
- Icon and text support
- Consistent glass effects

## 🛠️ Dependencies

- **liquid_glass_renderer**: ^0.1.1-dev.10 - Core glass rendering engine
- **iconsax_plus**: ^1.0.0 - Modern icon set
- **flutter**: Latest stable version

## 🚀 Getting Started

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd liquid_glass_button
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🎯 Usage Examples

### Creating a Glass Button

```dart
LiquidGlassButton(
  onPressed: () => handlePress(),
  borderRadius: 22,
  settings: LiquidGlassSettings(
    thickness: 16,
    blur: 8,
    glassColor: Color(0x33FFFFFF),
  ),
  child: Row(
    children: [
      Icon(Icons.home, size: 18),
      SizedBox(width: 6),
      Text('Home'),
    ],
  ),
)
```

### Creating a Glass Panel

```dart
GlassPanel(
  height: 180,
  borderRadius: 28,
  settings: LiquidGlassSettings(
    thickness: 14,
    blur: 8,
    glassColor: Color(0x33FFFFFF),
  ),
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Text('Glass Panel Content'),
  ),
)
```

### Creating a Button Group

```dart
BlendedGlassButtonGroup(
  settings: LiquidGlassSettings(
    thickness: 12,
    blur: 6,
    glassColor: Color(0x22FFFFFF),
    blend: 48,
  ),
  children: [
    LiquidGlassButton(onPressed: () {}, child: Text('Button 1')),
    LiquidGlassButton(onPressed: () {}, child: Text('Button 2')),
  ],
)
```

## 🎨 Customization

### iOS-Inspired Glass Settings

The `LiquidGlassSettings` class allows you to customize glass effects that mimic iOS design:

- **thickness**: Glass effect thickness (similar to iOS blur intensity)
- **blur**: Blur intensity matching iOS system blur
- **glassColor**: Glass color with alpha (iOS-style transparency)
- **lightIntensity**: Light reflection intensity (iOS ambient light)
- **blend**: Blend mode intensity (iOS layer blending)
- **saturation**: Color saturation (iOS color accuracy)
- **lightness**: Color lightness (iOS brightness control)

### Button States

Buttons automatically handle:

- **Normal**: Default glass appearance
- **Hover**: Enhanced light intensity
- **Focus**: Keyboard navigation support
- **Pressed**: Scale animation and enhanced effects
- **Disabled**: Reduced opacity and effects
- **Loading**: Loading spinner display

## 🔧 Development

### Adding New Glass Components

1. Create a new widget in the appropriate directory
2. Use `LiquidGlass` or `LiquidGlass.inLayer` for glass effects
3. Configure `LiquidGlassSettings` for desired appearance
4. Add to the demo screen for testing

### iOS-Inspired Styling Guidelines

- Use consistent border radius values (16, 20, 22, 28) matching iOS design system
- Maintain glass color consistency (0x22FFFFFF, 0x33FFFFFF) for iOS-style transparency
- Apply appropriate spacing (12px, 16px, 20px) following iOS Human Interface Guidelines
- Use white text/icons for dark backgrounds (iOS dark mode support)
- Implement subtle shadows and highlights for depth (iOS depth perception)
- Use smooth easing curves (Curves.easeOut) for iOS-like animations

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

**Built by Yazdan Haider using Flutter and Liquid Glass Renderer, inspired by iOS design language**
