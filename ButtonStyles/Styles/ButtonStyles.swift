//
//  ButtonStyles.swift
//  ButtonStyles
//
//  Production button styles with loading and disabled states
//

import SwiftUI

// MARK: - Button Style Variants

/// Primary button style - main action button
struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .background(
                Group {
                    if isLoading {
                        LinearGradient(
                            colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.8)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    } else if isEnabled {
                        LinearGradient(
                            colors: [Color.blue, Color.blue.opacity(0.9)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    } else {
                        LinearGradient(
                            colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                }
            )
            .cornerRadius(size.cornerRadius)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    }
                }
            )
            .onChange(of: configuration.isPressed) { _, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = newValue
                }
                if newValue && isEnabled && !isLoading {
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                }
            }
    }
}

/// Secondary button style - secondary action button
struct SecondaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize, weight: .semibold, design: .default))
            .foregroundColor(isEnabled ? .blue : .gray)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .background(
                Group {
                    if isLoading {
                        Color.blue.opacity(0.1)
                    } else if isEnabled {
                        Color.blue.opacity(0.1)
                    } else {
                        Color.gray.opacity(0.1)
                    }
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .stroke(isEnabled ? Color.blue : Color.gray, lineWidth: 2)
            )
            .cornerRadius(size.cornerRadius)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(0.8)
                    }
                }
            )
            .onChange(of: configuration.isPressed) { _, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = newValue
                }
                if newValue && isEnabled && !isLoading {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                }
            }
    }
}

/// Tertiary button style - subtle action button
struct TertiaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        let horizontalPadding: CGFloat = {
            switch size {
            case .small: return 12
            case .medium: return 16
            case .large: return 20
            }
        }()
        
        let verticalPadding: CGFloat = {
            switch size {
            case .small: return 8
            case .medium: return 10
            case .large: return 12
            }
        }()
        
        return configuration.label
            .font(.system(size: size.fontSize, weight: .medium, design: .default))
            .foregroundColor(isEnabled ? .blue : .gray)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(
                Group {
                    if isLoading {
                        Color.clear
                    } else if isEnabled {
                        Color.clear
                    } else {
                        Color.clear
                    }
                }
            )
            .scaleEffect(isPressed ? 0.96 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.5)
            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(0.8)
                    }
                }
            )
            .onChange(of: configuration.isPressed) { _, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = newValue
                }
                if newValue && isEnabled && !isLoading {
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    generator.impactOccurred()
                }
            }
    }
}

// MARK: - Gradient Button Style

struct GradientButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var colors: [Color] = [Color.purple, Color.pink, Color.orange]
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .background(
                Group {
                    if isLoading {
                        LinearGradient(
                            colors: colors.map { $0.opacity(0.6) },
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    } else if isEnabled {
                        LinearGradient(
                            colors: colors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    } else {
                        LinearGradient(
                            colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    }
                }
            )
            .cornerRadius(size.cornerRadius)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    }
                }
            )
            .onChange(of: configuration.isPressed) { _, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = newValue
                }
                if newValue && isEnabled && !isLoading {
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                }
            }
    }
}

// MARK: - Glassmorphism Button Style

struct GlassmorphismButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize, weight: .semibold, design: .default))
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .background(
                Group {
                    if isLoading {
                        ZStack {
                            // Blur background
                            RoundedRectangle(cornerRadius: size.cornerRadius)
                                .fill(.ultraThinMaterial)
                                .opacity(0.8)
                            
                            // Glass effect
                            RoundedRectangle(cornerRadius: size.cornerRadius)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.white.opacity(0.25),
                                            Color.white.opacity(0.1)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: size.cornerRadius)
                                        .stroke(
                                            LinearGradient(
                                                colors: [
                                                    Color.white.opacity(0.6),
                                                    Color.white.opacity(0.2)
                                                ],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 1
                                        )
                                )
                        }
                    } else if isEnabled {
                        ZStack {
                            // Blur background
                            RoundedRectangle(cornerRadius: size.cornerRadius)
                                .fill(.ultraThinMaterial)
                            
                            // Glass effect
                            RoundedRectangle(cornerRadius: size.cornerRadius)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.white.opacity(0.35),
                                            Color.white.opacity(0.15)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: size.cornerRadius)
                                        .stroke(
                                            LinearGradient(
                                                colors: [
                                                    Color.white.opacity(0.7),
                                                    Color.white.opacity(0.3)
                                                ],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 1.5
                                        )
                                )
                        }
                    } else {
                        RoundedRectangle(cornerRadius: size.cornerRadius)
                            .fill(.ultraThinMaterial)
                            .opacity(0.5)
                    }
                }
            )
            .cornerRadius(size.cornerRadius)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .primary))
                            .scaleEffect(0.8)
                    }
                }
            )
            .onChange(of: configuration.isPressed) { _, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    isPressed = newValue
                }
                if newValue && isEnabled && !isLoading {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                }
            }
    }
}

// MARK: - Button Size Enum

enum ButtonSize {
    case small
    case medium
    case large
    
    var height: CGFloat {
        switch self {
        case .small: return 44
        case .medium: return 50
        case .large: return 56
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .small: return 15
        case .medium: return 17
        case .large: return 19
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .small: return 10
        case .medium: return 12
        case .large: return 14
        }
    }
}

// MARK: - Button Style View Modifiers

extension View {
    /// Apply primary button style
    func primaryButtonStyle(size: ButtonSize = .medium, isLoading: Bool = false) -> some View {
        self.buttonStyle(PrimaryButtonStyle(size: size, isLoading: isLoading))
    }
    
    /// Apply secondary button style
    func secondaryButtonStyle(size: ButtonSize = .medium, isLoading: Bool = false) -> some View {
        self.buttonStyle(SecondaryButtonStyle(size: size, isLoading: isLoading))
    }
    
    /// Apply tertiary button style
    func tertiaryButtonStyle(size: ButtonSize = .medium, isLoading: Bool = false) -> some View {
        self.buttonStyle(TertiaryButtonStyle(size: size, isLoading: isLoading))
    }
    
    /// Apply gradient button style
    func gradientButtonStyle(
        size: ButtonSize = .medium,
        isLoading: Bool = false,
        colors: [Color] = [Color.purple, Color.pink, Color.orange]
    ) -> some View {
        self.buttonStyle(GradientButtonStyle(size: size, isLoading: isLoading, colors: colors))
    }
    
    /// Apply glassmorphism button style
    func glassmorphismButtonStyle(size: ButtonSize = .medium, isLoading: Bool = false) -> some View {
        self.buttonStyle(GlassmorphismButtonStyle(size: size, isLoading: isLoading))
    }
}

