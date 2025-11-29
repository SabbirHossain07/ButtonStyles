//
//  IconButton.swift
//  ButtonStyles
//
//  Icon button components with loading states
//

import SwiftUI

// MARK: - Icon Button

/// A button that displays an icon with optional loading state
struct IconButton: View {
    let icon: String
    let action: () -> Void
    
    var size: IconButtonSize = .medium
    var isLoading: Bool = false
    var isEnabled: Bool = true
    var style: IconButtonStyleType = .primary
    var hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle = .medium
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            if isEnabled && !isLoading {
                let generator = UIImpactFeedbackGenerator(style: hapticStyle)
                generator.impactOccurred()
                action()
            }
        }) {
            Group {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: style.foregroundColor))
                        .scaleEffect(0.9)
                } else {
                    Image(systemName: icon)
                        .font(.system(size: size.iconSize, weight: .semibold))
                        .foregroundColor(style.foregroundColor)
                }
            }
            .frame(width: size.buttonSize, height: size.buttonSize)
            .background(style.backgroundColor)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(style.borderColor, lineWidth: style.borderWidth)
            )
            .scaleEffect(isPressed ? 0.92 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
            .shadow(color: style.shadowColor, radius: style.shadowRadius, x: 0, y: style.shadowY)
        }
        .disabled(!isEnabled || isLoading)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if isEnabled && !isLoading {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed = true
                        }
                    }
                }
                .onEnded { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
        )
    }
}

// MARK: - Icon Button with Text

/// A button that displays an icon with text label
struct IconTextButton: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var isEnabled: Bool = true
    var style: ButtonStyleType = .primary
    var iconPosition: IconPosition = .leading
    var hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle = .medium
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            if isEnabled && !isLoading {
                let generator = UIImpactFeedbackGenerator(style: hapticStyle)
                generator.impactOccurred()
                action()
            }
        }) {
            HStack(spacing: 12) {
                if iconPosition == .leading {
                    iconView
                }
                
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: style.foregroundColor))
                        .scaleEffect(0.8)
                } else {
                    Text(title)
                        .font(.system(size: size.fontSize, weight: .semibold))
                        .foregroundColor(style.foregroundColor)
                }
                
                if iconPosition == .trailing {
                    iconView
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .background(backgroundView)
            .overlay(
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .stroke(style.borderColor, lineWidth: style.borderWidth)
            )
            .cornerRadius(size.cornerRadius)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
        }
        .disabled(!isEnabled || isLoading)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if isEnabled && !isLoading {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            isPressed = true
                        }
                    }
                }
                .onEnded { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
        )
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .primary:
            LinearGradient(
                colors: [Color.blue, Color.blue.opacity(0.9)],
                startPoint: .leading,
                endPoint: .trailing
            )
        case .secondary:
            Color.blue.opacity(0.1)
        case .tertiary:
            Color.clear
        case .gradient(let colors):
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .glassmorphism:
            ZStack {
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .fill(.ultraThinMaterial)
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
            }
        }
    }
    
    @ViewBuilder
    private var iconView: some View {
        if !isLoading {
            Image(systemName: icon)
                .font(.system(size: size.fontSize * 0.9, weight: .semibold))
                .foregroundColor(style.foregroundColor)
        }
    }
}

// MARK: - Supporting Types

enum IconButtonSize {
    case small
    case medium
    case large
    
    var buttonSize: CGFloat {
        switch self {
        case .small: return 44
        case .medium: return 50
        case .large: return 56
        }
    }
    
    var iconSize: CGFloat {
        switch self {
        case .small: return 20
        case .medium: return 24
        case .large: return 28
        }
    }
}

enum IconButtonStyleType {
    case primary
    case secondary
    case tertiary
    
    var foregroundColor: Color {
        switch self {
        case .primary: return .white
        case .secondary: return .blue
        case .tertiary: return .primary
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .primary: return .blue
        case .secondary: return Color.blue.opacity(0.1)
        case .tertiary: return Color.clear
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary: return .clear
        case .secondary: return .blue
        case .tertiary: return .clear
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .primary: return 0
        case .secondary: return 2
        case .tertiary: return 0
        }
    }
    
    var shadowColor: Color {
        switch self {
        case .primary: return Color.blue.opacity(0.3)
        case .secondary: return Color.clear
        case .tertiary: return Color.clear
        }
    }
    
    var shadowRadius: CGFloat {
        switch self {
        case .primary: return 8
        case .secondary: return 0
        case .tertiary: return 0
        }
    }
    
    var shadowY: CGFloat {
        switch self {
        case .primary: return 4
        case .secondary: return 0
        case .tertiary: return 0
        }
    }
}

enum IconPosition {
    case leading
    case trailing
}

// MARK: - Simplified Button Style Types for Icon Buttons

enum ButtonStyleType {
    case primary
    case secondary
    case tertiary
    case gradient([Color])
    case glassmorphism
    
    var foregroundColor: Color {
        switch self {
        case .primary: return .white
        case .secondary: return .blue
        case .tertiary: return .blue
        case .gradient: return .white
        case .glassmorphism: return .primary
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary: return .clear
        case .secondary: return .blue
        case .tertiary: return .clear
        case .gradient: return .clear
        case .glassmorphism: return .clear
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .primary: return 0
        case .secondary: return 2
        case .tertiary: return 0
        case .gradient: return 0
        case .glassmorphism: return 0
        }
    }
}

