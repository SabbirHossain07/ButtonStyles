//
//  ButtonStyles+Animations.swift
//  ButtonStyles
//
//  Animated button styles with floating, shimmer, and pulse effects
//

import SwiftUI

// MARK: - Floating Button Style

/// Floating button style with continuous floating animation
struct FloatingButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    @State private var floatOffset: CGFloat = 0
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var animationSpeed: Double = 2.0
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .background(
                LinearGradient(
                    colors: isEnabled ? [Color.blue, Color.blue.opacity(0.9)] : [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(size.cornerRadius)
            .offset(y: floatOffset)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
            .shadow(color: Color.blue.opacity(0.4), radius: 15, x: 0, y: floatOffset + 10)
            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    }
                }
            )
            .onAppear {
                withAnimation(
                    Animation.easeInOut(duration: animationSpeed)
                        .repeatForever(autoreverses: true)
                ) {
                    floatOffset = -8
                }
            }
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

// MARK: - Shimmer Button Style

/// Shimmer button style with animated gradient shine effect
struct ShimmerButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    @State private var shimmerOffset: CGFloat = -200
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var baseColor: Color = .blue
    var shimmerColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // Base gradient
            LinearGradient(
                colors: isEnabled ? [baseColor, baseColor.opacity(0.9)] : [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                startPoint: .leading,
                endPoint: .trailing
            )
            
            // Shimmer effect
            if isEnabled {
                LinearGradient(
                    colors: [
                        .clear,
                        shimmerColor.opacity(0.3),
                        shimmerColor.opacity(0.6),
                        shimmerColor.opacity(0.3),
                        .clear
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .offset(x: shimmerOffset)
                .mask(
                    RoundedRectangle(cornerRadius: size.cornerRadius)
                        .fill(
                            LinearGradient(
                                colors: [.clear, .black, .black, .clear],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                )
            }
            
            // Content
            configuration.label
                .font(.system(size: size.fontSize, weight: .semibold, design: .default))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: size.height)
        .cornerRadius(size.cornerRadius)
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .opacity(isEnabled ? 1.0 : 0.6)
        .shadow(color: baseColor.opacity(0.3), radius: 10, x: 0, y: 5)
        .overlay(
            Group {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                }
            }
        )
        .onAppear {
            withAnimation(
                Animation.linear(duration: 2.0)
                    .repeatForever(autoreverses: false)
            ) {
                shimmerOffset = 400
            }
        }
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

// MARK: - Pulse Button Style

/// Pulse button style with continuous pulsing animation
struct PulseButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    @State private var pulseScale: CGFloat = 1.0
    @State private var pulseOpacity: Double = 0.5
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var pulseColor: Color = .blue
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // Pulse ring - using rounded rectangle for better button shape
            if isEnabled {
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .stroke(pulseColor.opacity(pulseOpacity), lineWidth: 3)
                    .frame(maxWidth: .infinity)
                    .frame(height: size.height)
                    .scaleEffect(pulseScale)
            }
            
            // Button content
            configuration.label
                .font(.system(size: size.fontSize, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: size.height)
                .background(
                    LinearGradient(
                        colors: isEnabled ? [pulseColor, pulseColor.opacity(0.9)] : [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(size.cornerRadius)
                .scaleEffect(isPressed ? 0.95 : 1.0)
        }
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
        .onAppear {
            withAnimation(
                Animation.easeOut(duration: 1.5)
                    .repeatForever(autoreverses: false)
            ) {
                pulseScale = 1.3
                pulseOpacity = 0.0
            }
        }
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

// MARK: - Bounce Button Style

/// Bounce button style with animated bounce effect
struct BounceButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    @State private var bounceOffset: CGFloat = 0
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .background(
                LinearGradient(
                    colors: isEnabled ? [Color.purple, Color.pink] : [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(size.cornerRadius)
            .offset(y: bounceOffset)
            .scaleEffect(isPressed ? 0.92 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
            .shadow(color: Color.purple.opacity(0.4), radius: 10, x: 0, y: 5)
            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    }
                }
            )
            .onAppear {
                // Continuous bounce animation
                bounceAnimation()
            }
            .onChange(of: configuration.isPressed) { _, newValue in
                if newValue && isEnabled && !isLoading {
                    // Quick bounce on press
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        bounceOffset = -5
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                            bounceOffset = 0
                        }
                    }
                    
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                } else {
                    bounceOffset = 0
                }
            }
    }
    
    private func bounceAnimation() {
        withAnimation(
            Animation.easeInOut(duration: 1.5)
                .repeatForever(autoreverses: true)
        ) {
            bounceOffset = -4
        }
    }
}

// MARK: - Glow Button Style

/// Glow button style with animated glow effect
struct GlowButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    @State private var glowIntensity: Double = 0.5
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var glowColor: Color = .cyan
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .background(
                LinearGradient(
                    colors: isEnabled ? [glowColor, glowColor.opacity(0.8)] : [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(size.cornerRadius)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .opacity(isEnabled ? 1.0 : 0.6)
            .shadow(
                color: glowColor.opacity(glowIntensity),
                radius: 15,
                x: 0,
                y: 0
            )
            .overlay(
                Group {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    }
                }
            )
            .onAppear {
                withAnimation(
                    Animation.easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: true)
                ) {
                    glowIntensity = 1.0
                }
            }
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

// MARK: - Gradient Shimmer Button Style

/// Gradient shimmer button with animated gradient movement
struct GradientShimmerButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    @State private var gradientOffset: CGFloat = 0
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var colors: [Color] = [Color.purple, Color.pink, Color.orange]
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack {
                // Animated gradient background with shimmer
                ZStack {
                    // Base gradient
                    LinearGradient(
                        colors: isEnabled ? colors : [Color.gray.opacity(0.3), Color.gray.opacity(0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    // Shimmer overlay
                    if isEnabled {
                        LinearGradient(
                            colors: [
                                .clear,
                                .white.opacity(0.3),
                                .white.opacity(0.6),
                                .white.opacity(0.3),
                                .clear
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .offset(x: gradientOffset - geometry.size.width)
                        .mask(
                            RoundedRectangle(cornerRadius: size.cornerRadius)
                        )
                    }
                }
                
                // Content
                configuration.label
                    .font(.system(size: size.fontSize, weight: .semibold, design: .default))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: size.height)
        .cornerRadius(size.cornerRadius)
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .opacity(isEnabled ? 1.0 : 0.6)
        .shadow(color: colors.first?.opacity(0.4) ?? Color.clear, radius: 10, x: 0, y: 5)
        .overlay(
            Group {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                }
            }
        )
        .onAppear {
            withAnimation(
                Animation.linear(duration: 2.0)
                    .repeatForever(autoreverses: false)
            ) {
                gradientOffset = 600
            }
        }
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


// MARK: - Rotating Stroke Border Button Style

/// Rotating stroke border button with animated rotating border segments
struct RotatingStrokeBorderButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    @State private var rotationAngle: Double = 0
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var strokeColor: Color = .blue
    var strokeWidth: CGFloat = 4.0
    var animationDuration: Double = 3.0
    var segments: Int = 4 // Number of stroke segments (90 degree segments = 4)
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // Button content
            configuration.label
                .font(.system(size: size.fontSize, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: size.height)
                .background(
                    LinearGradient(
                        colors: isEnabled ? [strokeColor.opacity(0.1), strokeColor.opacity(0.05)] : [Color.gray.opacity(0.1), Color.gray.opacity(0.1)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(size.cornerRadius)
                .scaleEffect(isPressed ? 0.98 : 1.0)
            
            // Rotating stroke segments
            if isEnabled {
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<segments, id: \.self) { index in
                            let segmentAngle = 360.0 / Double(segments)
                            let startAngle = Double(index) * segmentAngle
                            let currentRotation = rotationAngle + startAngle
                            
                            // Create arc segment
                            Path { path in
                                let center = CGPoint(
                                    x: geometry.size.width / 2,
                                    y: geometry.size.height / 2
                                )
                                let radius = min(geometry.size.width, geometry.size.height) / 2
                                let startRad = startAngle * .pi / 180
                                let endRad = (startAngle + segmentAngle * 0.8) * .pi / 180
                                
                                path.addArc(
                                    center: center,
                                    radius: radius - strokeWidth / 2,
                                    startAngle: .radians(startRad),
                                    endAngle: .radians(endRad),
                                    clockwise: false
                                )
                            }
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        strokeColor.opacity(0.0),
                                        strokeColor,
                                        strokeColor.opacity(0.0)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                style: StrokeStyle(
                                    lineWidth: strokeWidth,
                                    lineCap: .round,
                                    lineJoin: .round
                                )
                            )
                            .rotationEffect(.degrees(currentRotation), anchor: .center)
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: size.cornerRadius))
            }
        }
        .opacity(isEnabled ? 1.0 : 0.6)
        .shadow(color: strokeColor.opacity(0.3), radius: 10, x: 0, y: 5)
        .overlay(
            Group {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: strokeColor))
                        .scaleEffect(0.8)
                }
            }
        )
        .onAppear {
            // Continuous clockwise rotation (never stops)
            withAnimation(
                Animation.linear(duration: animationDuration)
                    .repeatForever(autoreverses: false)
            ) {
                rotationAngle = 360
            }
        }
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


// MARK: - View Modifiers for Animated Styles

extension View {
    /// Apply floating button style with continuous floating animation
    func floatingButtonStyle(size: ButtonSize = .medium, isLoading: Bool = false, animationSpeed: Double = 2.0) -> some View {
        self.buttonStyle(FloatingButtonStyle(size: size, isLoading: isLoading, animationSpeed: animationSpeed))
    }
    
    /// Apply shimmer button style with animated shine effect
    func shimmerButtonStyle(
        size: ButtonSize = .medium,
        isLoading: Bool = false,
        baseColor: Color = .blue,
        shimmerColor: Color = .white
    ) -> some View {
        self.buttonStyle(ShimmerButtonStyle(size: size, isLoading: isLoading, baseColor: baseColor, shimmerColor: shimmerColor))
    }
    
    /// Apply pulse button style with continuous pulsing animation
    func pulseButtonStyle(
        size: ButtonSize = .medium,
        isLoading: Bool = false,
        pulseColor: Color = .blue
    ) -> some View {
        self.buttonStyle(PulseButtonStyle(size: size, isLoading: isLoading, pulseColor: pulseColor))
    }
    
    /// Apply bounce button style with animated bounce effect
    func bounceButtonStyle(size: ButtonSize = .medium, isLoading: Bool = false) -> some View {
        self.buttonStyle(BounceButtonStyle(size: size, isLoading: isLoading))
    }
    
    /// Apply glow button style with animated glow effect
    func glowButtonStyle(
        size: ButtonSize = .medium,
        isLoading: Bool = false,
        glowColor: Color = .cyan
    ) -> some View {
        self.buttonStyle(GlowButtonStyle(size: size, isLoading: isLoading, glowColor: glowColor))
    }
    
    /// Apply gradient shimmer button style with animated gradient movement
    func gradientShimmerButtonStyle(
        size: ButtonSize = .medium,
        isLoading: Bool = false,
        colors: [Color] = [Color.purple, Color.pink, Color.orange]
    ) -> some View {
        self.buttonStyle(GradientShimmerButtonStyle(size: size, isLoading: isLoading, colors: colors))
    }
    
}

// MARK: - Glowing Multi-Color Border Button Style

/// Glowing multi-color border button with rotating gradient glow effect (like GPT-5 input style)
struct GlowingMultiColorBorderButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isPressed = false
    @State private var rotationAngle: Double = 0
    
    var size: ButtonSize = .medium
    var isLoading: Bool = false
    var glowColors: [Color] = [.purple, .cyan, .blue, .green, .orange, .red]
    var strokeWidth: CGFloat = 3.0
    var glowRadius: CGFloat = 20.0
    var animationDuration: Double = 3.0
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // Button background
            configuration.label
                .font(.system(size: size.fontSize, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: size.height)
                .background(
                    RoundedRectangle(cornerRadius: size.cornerRadius)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.black.opacity(0.3),
                                    Color.gray.opacity(0.2)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                )
                .cornerRadius(size.cornerRadius)
                .scaleEffect(isPressed ? 0.98 : 1.0)
            
            // Static multi-color glowing border (NO ROTATION - just static glow)
            if isEnabled {
                ZStack {
                    // Outer glow layer with rotating colors
                    RoundedRectangle(cornerRadius: size.cornerRadius)
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(colors: glowColors + glowColors),
                                center: .center,
                                angle: .degrees(rotationAngle)
                            ),
                            style: StrokeStyle(
                                lineWidth: strokeWidth,
                                lineCap: .round,
                                lineJoin: .round
                            )
                        )
                        .blur(radius: glowRadius * 0.5)
                        .opacity(0.8)
                    
                    // Main border with rotating colors
                    RoundedRectangle(cornerRadius: size.cornerRadius)
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(colors: glowColors + glowColors),
                                center: .center,
                                angle: .degrees(rotationAngle)
                            ),
                            style: StrokeStyle(
                                lineWidth: strokeWidth,
                                lineCap: .round,
                                lineJoin: .round
                            )
                        )
                }
            }
        }
        .opacity(isEnabled ? 1.0 : 0.6)
        .shadow(
            color: (glowColors.first ?? .purple).opacity(0.5),
            radius: glowRadius,
            x: 0,
            y: 0
        )
        .overlay(
            Group {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(0.8)
                }
            }
        )
        .onAppear {
            // Rotate colors clockwise (gradient moves around border)
            withAnimation(
                Animation.linear(duration: animationDuration)
                    .repeatForever(autoreverses: false)
            ) {
                rotationAngle = 360
            }
        }
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

// MARK: - View Modifier Extension for Glowing Border

extension View {
    /// Apply glowing multi-color border button style (like GPT-5 input style)
    func glowingMultiColorBorderButtonStyle(
        size: ButtonSize = .medium,
        isLoading: Bool = false,
        glowColors: [Color] = [.purple, .cyan, .blue, .green, .orange, .red],
        strokeWidth: CGFloat = 3.0,
        glowRadius: CGFloat = 20.0,
        animationDuration: Double = 3.0
    ) -> some View {
        self.buttonStyle(
            GlowingMultiColorBorderButtonStyle(
                size: size,
                isLoading: isLoading,
                glowColors: glowColors,
                strokeWidth: strokeWidth,
                glowRadius: glowRadius,
                animationDuration: animationDuration
            )
        )
    }
}

