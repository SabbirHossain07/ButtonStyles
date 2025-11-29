# Button Styles Pack

A comprehensive, production-ready SwiftUI button styles library with loading states, haptics, and accessibility support.

![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)
![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## Features

✨ **Button Style Variants**
- Primary/Secondary/Tertiary button styles
- Gradient button styles with customizable colors
- Glassmorphism (frosted glass) button styles

🎬 **Animated Button Styles**
- Floating buttons with continuous floating animation
- Shimmer effect with animated shine
- Pulse animation with expanding rings
- Bounce effect with spring animation
- Glow effect with animated intensity
- Gradient shimmer with moving gradient overlay
- Rotating stroke with continuous 90-degree rotation
- Animated border with sequential segment animation
- Glowing multi-color border with rotating gradient (GPT-5 style)

🎨 **Icon Buttons**
- Standalone icon buttons
- Icon + text button combinations
- Customizable icon positions (leading/trailing)

⚡ **Loading States**
- Built-in loading progress indicators
- Smooth transitions between states
- Automatic button disabling during loading

🎯 **Size Variants**
- Small, Medium, and Large sizes
- Consistent design language across all sizes

📱 **Haptics Support**
- Tactile feedback on button press
- Customizable haptic styles
- Respects user preferences

♿ **Accessibility**
- Large content support
- Full VoiceOver compatibility
- Dynamic Type support

## Requirements

- iOS 15.0+ / macOS 12.0+ / watchOS 8.0+ / tvOS 15.0+
- Swift 5.9+
- Xcode 14.0+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/ButtonStyles.git", from: "1.0.0")
]
```

Or add it via Xcode:
1. File → Add Packages...
2. Enter the repository URL
3. Select version rules
4. Click Add Package

### Manual Installation

1. Download or clone the repository
2. Drag the `ButtonStyles` folder into your Xcode project
3. Make sure "Copy items if needed" is checked

## Quick Start

### Basic Button Styles

```swift
import SwiftUI
import ButtonStyles

struct MyView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Primary Button
            Button("Primary Button") {
                // Your action
            }
            .primaryButtonStyle()
            
            // Secondary Button
            Button("Secondary Button") {
                // Your action
            }
            .secondaryButtonStyle()
            
            // Tertiary Button
            Button("Tertiary Button") {
                // Your action
            }
            .tertiaryButtonStyle()
        }
    }
}
```

### Button Sizes

```swift
Button("Small Button") { }
    .primaryButtonStyle(size: .small)

Button("Medium Button") { }
    .primaryButtonStyle(size: .medium)

Button("Large Button") { }
    .primaryButtonStyle(size: .large)
```

### Loading States

```swift
@State private var isLoading = false

Button("Save") {
    isLoading = true
    // Perform async operation
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        isLoading = false
    }
}
.primaryButtonStyle(isLoading: isLoading)
```

### Gradient Buttons

```swift
Button("Gradient Button") {
    // Your action
}
.gradientButtonStyle(
    colors: [Color.purple, Color.pink, Color.orange]
)
```

### Glassmorphism Buttons

```swift
Button("Glass Button") {
    // Your action
}
.glassmorphismButtonStyle()
```

### Animated Buttons

```swift
// Floating Button
Button("Floating Button") {
    // Your action
}
.floatingButtonStyle(animationSpeed: 2.0)

// Shimmer Button
Button("Shimmer Effect") {
    // Your action
}
.shimmerButtonStyle(baseColor: .blue, shimmerColor: .white)

// Pulse Button
Button("Pulse Animation") {
    // Your action
}
.pulseButtonStyle(pulseColor: .green)

// Bounce Button
Button("Bounce Effect") {
    // Your action
}
.bounceButtonStyle()

// Glow Button
Button("Glow Effect") {
    // Your action
}
.glowButtonStyle(glowColor: .cyan)

// Gradient Shimmer
Button("Gradient Shimmer") {
    // Your action
}
.gradientShimmerButtonStyle(
    colors: [Color.purple, Color.pink, Color.orange]
)

// Rotating Stroke (90-degree continuous)
Button("Rotating Stroke") {
    // Your action
}
.continuousRotatingStrokeButtonStyle(
    strokeColor: .blue,
    strokeWidth: 4.0,
    animationDuration: 3.0
)

// Animated Border
Button("Animated Border") {
    // Your action
}
.animatedBorderButtonStyle(
    strokeColor: .green,
    animationDuration: 2.0
)

// Glowing Multi-Color Border (GPT-5 Style)
Button("Glowing Border") {
    // Your action
}
.glowingMultiColorBorderButtonStyle(
    glowColors: [.purple, .cyan, .blue, .green, .orange, .red],
    strokeWidth: 3.0,
    glowRadius: 20.0,
    animationDuration: 3.0
)
```

### Icon Buttons

```swift
// Standalone Icon Button
IconButton(
    icon: "heart.fill",
    action: {
        // Your action
    },
    size: .medium,
    style: .primary
)

// Icon Button with Loading
IconButton(
    icon: "star.fill",
    action: {
        // Your action
    },
    size: .large,
    isLoading: true,
    style: .primary
)

// Icon + Text Button
IconTextButton(
    icon: "arrow.right",
    title: "Continue",
    action: {
        // Your action
    },
    size: .medium,
    style: .primary,
    iconPosition: .trailing
)
```

### Disabled States

All button styles automatically support disabled states:

```swift
Button("Disabled Button") {
    // Your action
}
.primaryButtonStyle()
.disabled(true)
```

## API Reference

### Button Style Modifiers

#### `primaryButtonStyle(size:isLoading:)`
Applies primary button style with solid background.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`

#### `secondaryButtonStyle(size:isLoading:)`
Applies secondary button style with outlined appearance.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`

#### `tertiaryButtonStyle(size:isLoading:)`
Applies tertiary button style with text-only appearance.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`

#### `gradientButtonStyle(size:isLoading:colors:)`
Applies gradient button style with customizable colors.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `colors`: [Color] - Default: `[Color.purple, Color.pink, Color.orange]`

#### `glassmorphismButtonStyle(size:isLoading:)`
Applies glassmorphism (frosted glass) button style.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`

#### `floatingButtonStyle(size:isLoading:animationSpeed:)`
Applies floating button style with continuous floating animation.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `animationSpeed`: Double - Animation duration in seconds - Default: `2.0`

#### `shimmerButtonStyle(size:isLoading:baseColor:shimmerColor:)`
Applies shimmer button style with animated shine effect.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `baseColor`: Color - Base button color - Default: `.blue`
- `shimmerColor`: Color - Shimmer highlight color - Default: `.white`

#### `pulseButtonStyle(size:isLoading:pulseColor:)`
Applies pulse button style with continuous pulsing animation.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `pulseColor`: Color - Pulse ring color - Default: `.blue`

#### `bounceButtonStyle(size:isLoading:)`
Applies bounce button style with animated bounce effect.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`

#### `glowButtonStyle(size:isLoading:glowColor:)`
Applies glow button style with animated glow effect.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `glowColor`: Color - Glow effect color - Default: `.cyan`

#### `gradientShimmerButtonStyle(size:isLoading:colors:)`
Applies gradient shimmer button style with animated gradient movement.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `colors`: [Color] - Gradient colors - Default: `[Color.purple, Color.pink, Color.orange]`

#### `continuousRotatingStrokeButtonStyle(size:isLoading:strokeColor:strokeWidth:animationDuration:)`
Applies continuous rotating stroke button style with 90-degree segment rotation.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `strokeColor`: Color - Stroke color - Default: `.blue`
- `strokeWidth`: CGFloat - Stroke width - Default: `4.0`
- `animationDuration`: Double - Rotation duration in seconds - Default: `3.0`

#### `animatedBorderButtonStyle(size:isLoading:strokeColor:strokeWidth:animationDuration:)`
Applies animated border button style with sequential 90-degree segment animation.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `strokeColor`: Color - Border color - Default: `.blue`
- `strokeWidth`: CGFloat - Border width - Default: `4.0`
- `animationDuration`: Double - Animation duration in seconds - Default: `2.0`

#### `rotatingStrokeButtonStyle(size:isLoading:strokeColor:strokeWidth:animationDuration:)`
Applies rotating stroke button style with continuous rotating border.

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `strokeColor`: Color - Stroke color - Default: `.blue`
- `strokeWidth`: CGFloat - Stroke width - Default: `3.0`
- `animationDuration`: Double - Rotation duration in seconds - Default: `2.0`

#### `glowingMultiColorBorderButtonStyle(size:isLoading:glowColors:strokeWidth:glowRadius:animationDuration:)`
Applies glowing multi-color border button style with rotating gradient glow effect (like GPT-5 input style).

- `size`: ButtonSize (`.small`, `.medium`, `.large`) - Default: `.medium`
- `isLoading`: Bool - Default: `false`
- `glowColors`: [Color] - Array of colors for the glowing border - Default: `[.purple, .cyan, .blue, .green, .orange, .red]`
- `strokeWidth`: CGFloat - Border stroke width - Default: `3.0`
- `glowRadius`: CGFloat - Blur radius for glow effect - Default: `20.0`
- `animationDuration`: Double - Rotation duration in seconds - Default: `3.0`

### Icon Button Components

#### `IconButton`
A standalone button that displays an icon.

```swift
IconButton(
    icon: String,              // SF Symbol name
    action: () -> Void,        // Action closure
    size: IconButtonSize,      // .small, .medium, .large
    isLoading: Bool,           // Loading state
    isEnabled: Bool,           // Enabled state
    style: IconButtonStyleType, // .primary, .secondary, .tertiary
    hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle
)
```

#### `IconTextButton`
A button that displays an icon with a text label.

```swift
IconTextButton(
    icon: String,              // SF Symbol name
    title: String,             // Button title
    action: () -> Void,        // Action closure
    size: ButtonSize,          // .small, .medium, .large
    isLoading: Bool,           // Loading state
    isEnabled: Bool,           // Enabled state
    style: ButtonStyleType,    // Button style variant
    iconPosition: IconPosition, // .leading, .trailing
    hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle
)
```

## Examples

Check out the included `ButtonShowcase` view for comprehensive examples of all button styles and features.

## Customization

All button styles are highly customizable. You can:

- Adjust colors and gradients
- Modify corner radius and sizes
- Customize haptic feedback intensity
- Create your own style variants by extending the button styles

## Accessibility

All buttons are fully accessible and support:

- VoiceOver navigation
- Dynamic Type scaling
- High contrast mode
- Reduced motion preferences

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with SwiftUI
- Inspired by modern iOS design patterns
- Haptic feedback powered by UIKit

## Support

If you find this project useful, please consider giving it a ⭐ on GitHub!

---

**Made with ❤️ for the SwiftUI community**

