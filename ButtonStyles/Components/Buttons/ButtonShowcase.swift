//
//  ButtonShowcase.swift
//  ButtonStyles
//
//  Comprehensive demo view showcasing all button styles
//

import SwiftUI

struct ButtonShowcase: View {
    @State private var primaryLoading = false
    @State private var secondaryLoading = false
    @State private var tertiaryLoading = false
    @State private var gradientLoading = false
    @State private var glassmorphismLoading = false
    @State private var iconButtonLoading = false
    @State private var disabledState = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 8) {
                    Text("Button Styles Pack")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Production button styles with loading and disabled states")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                
                // Primary Buttons
                buttonSection(
                    title: "Primary Buttons",
                    description: "Main action buttons with solid background"
                ) {
                    VStack(spacing: 16) {
                        Button(action: {
                            primaryLoading.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                primaryLoading = false
                            }
                        }) {
                            Text(primaryLoading ? "Loading..." : "Primary Button")
                        }
                        .primaryButtonStyle(size: .large, isLoading: primaryLoading)
                        
                        Button(action: {}) {
                            Text("Primary Medium")
                        }
                        .primaryButtonStyle(size: .medium)
                        
                        Button(action: {}) {
                            Text("Primary Small")
                        }
                        .primaryButtonStyle(size: .small)
                    }
                }
                
                // Secondary Buttons
                buttonSection(
                    title: "Secondary Buttons",
                    description: "Secondary action buttons with outlined style"
                ) {
                    VStack(spacing: 16) {
                        Button(action: {
                            secondaryLoading.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                secondaryLoading = false
                            }
                        }) {
                            Text(secondaryLoading ? "Loading..." : "Secondary Button")
                        }
                        .secondaryButtonStyle(size: .large, isLoading: secondaryLoading)
                        
                        Button(action: {}) {
                            Text("Secondary Medium")
                        }
                        .secondaryButtonStyle(size: .medium)
                        
                        Button(action: {}) {
                            Text("Secondary Small")
                        }
                        .secondaryButtonStyle(size: .small)
                    }
                }
                
                // Tertiary Buttons
                buttonSection(
                    title: "Tertiary Buttons",
                    description: "Subtle action buttons with text only"
                ) {
                    VStack(spacing: 16) {
                        HStack {
                            Spacer()
                            Button(action: {
                                tertiaryLoading.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    tertiaryLoading = false
                                }
                            }) {
                                Text(tertiaryLoading ? "Loading..." : "Tertiary Button")
                            }
                            .tertiaryButtonStyle(size: .large, isLoading: tertiaryLoading)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text("Tertiary Medium")
                            }
                            .tertiaryButtonStyle(size: .medium)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text("Tertiary Small")
                            }
                            .tertiaryButtonStyle(size: .small)
                            Spacer()
                        }
                    }
                }
                
                // Gradient Buttons
                buttonSection(
                    title: "Gradient Buttons",
                    description: "Eye-catching buttons with gradient backgrounds"
                ) {
                    VStack(spacing: 16) {
                        Button(action: {
                            gradientLoading.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                gradientLoading = false
                            }
                        }) {
                            Text(gradientLoading ? "Loading..." : "Gradient Button")
                        }
                        .gradientButtonStyle(size: .large, isLoading: gradientLoading)
                        
                        Button(action: {}) {
                            Text("Purple to Pink")
                        }
                        .gradientButtonStyle(
                            size: .medium,
                            colors: [Color.purple, Color.pink]
                        )
                        
                        Button(action: {}) {
                            Text("Blue to Cyan")
                        }
                        .gradientButtonStyle(
                            size: .medium,
                            colors: [Color.blue, Color.cyan]
                        )
                        
                        Button(action: {}) {
                            Text("Sunset Gradient")
                        }
                        .gradientButtonStyle(
                            size: .medium,
                            colors: [Color.orange, Color.red, Color.pink]
                        )
                    }
                }
                
                // Glassmorphism Buttons
                buttonSection(
                    title: "Glassmorphism Buttons",
                    description: "Modern frosted glass effect buttons"
                ) {
                    VStack(spacing: 16) {
                        Button(action: {
                            glassmorphismLoading.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                glassmorphismLoading = false
                            }
                        }) {
                            Text(glassmorphismLoading ? "Loading..." : "Glassmorphism Button")
                        }
                        .glassmorphismButtonStyle(size: .large, isLoading: glassmorphismLoading)
                        
                        Button(action: {}) {
                            Text("Glass Effect Medium")
                        }
                        .glassmorphismButtonStyle(size: .medium)
                        
                        Button(action: {}) {
                            Text("Glass Effect Small")
                        }
                        .glassmorphismButtonStyle(size: .small)
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(20)
                }
                
                // Icon Buttons
                buttonSection(
                    title: "Icon Buttons",
                    description: "Buttons with icons and loading states"
                ) {
                    VStack(spacing: 24) {
                        HStack(spacing: 20) {
                            IconButton(
                                icon: "heart.fill",
                                action: {},
                                size: .large,
                                style: .primary
                            )
                            
                            IconButton(
                                icon: "star.fill",
                                action: {
                                    iconButtonLoading.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        iconButtonLoading = false
                                    }
                                },
                                size: .large,
                                isLoading: iconButtonLoading,
                                style: .primary
                            )
                            
                            IconButton(
                                icon: "bookmark.fill",
                                action: {},
                                size: .large,
                                style: .secondary
                            )
                            
                            IconButton(
                                icon: "square.and.arrow.up.fill",
                                action: {},
                                size: .large,
                                style: .tertiary
                            )
                        }
                        
                        VStack(spacing: 16) {
                            IconTextButton(
                                icon: "arrow.right",
                                title: "Continue",
                                action: {},
                                size: .medium,
                                style: .primary,
                                iconPosition: .trailing
                            )
                            
                            IconTextButton(
                                icon: "plus.circle.fill",
                                title: "Add Item",
                                action: {},
                                size: .medium,
                                style: .secondary,
                                iconPosition: .leading
                            )
                            
                            IconTextButton(
                                icon: "trash.fill",
                                title: "Delete",
                                action: {},
                                size: .medium,
                                style: .tertiary,
                                iconPosition: .leading
                            )
                        }
                    }
                }
                
                // Animated Buttons
                buttonSection(
                    title: "Animated Buttons",
                    description: "Buttons with floating, shimmer, pulse, glow, and rotating stroke animations"
                ) {
                    VStack(spacing: 16) {
                        // Floating Button
                        Button(action: {}) {
                            Text("Floating Button")
                        }
                        .floatingButtonStyle(size: .medium)
                        
                        // Shimmer Button
                        Button(action: {}) {
                            Text("Shimmer Effect")
                        }
                        .shimmerButtonStyle(size: .medium)
                        
                        // Pulse Button
                        Button(action: {}) {
                            Text("Pulse Animation")
                        }
                        .pulseButtonStyle(size: .medium, pulseColor: .green)
                        
                        // Bounce Button
                        Button(action: {}) {
                            Text("Bounce Effect")
                        }
                        .bounceButtonStyle(size: .medium)
                        
                        // Glow Button
                        Button(action: {}) {
                            Text("Glow Effect")
                        }
                        .glowButtonStyle(size: .medium, glowColor: .cyan)
                        
                        // Gradient Shimmer
                        Button(action: {}) {
                            Text("Gradient Shimmer")
                        }
                        .gradientShimmerButtonStyle(
                            size: .medium,
                            colors: [Color.purple, Color.pink, Color.orange]
                        )
                        
                        // Glowing Multi-Color Border (GPT-5 Style)
                        Button(action: {}) {
                            Text("Glowing Multi Color Border")
                        }
                        .glowingMultiColorBorderButtonStyle(
                            size: .medium,
                            glowColors: [.purple, .cyan, .blue, .green, .orange, .red],
                            strokeWidth: 3.0,
                            glowRadius: 20.0,
                            animationDuration: 3.0
                        )
                    }
                }
                
                // Disabled States
                buttonSection(
                    title: "Disabled States",
                    description: "All button styles support disabled states"
                ) {
                    VStack(spacing: 16) {
                        Button(action: {}) {
                            Text("Disabled Primary")
                        }
                        .primaryButtonStyle()
                        .disabled(true)
                        
                        Button(action: {}) {
                            Text("Disabled Secondary")
                        }
                        .secondaryButtonStyle()
                        .disabled(true)
                        
                        Button(action: {}) {
                            Text("Disabled Gradient")
                        }
                        .gradientButtonStyle()
                        .disabled(true)
                    }
                }
                
                // Size Variants
                buttonSection(
                    title: "Size Variants",
                    description: "Small, Medium, and Large sizes"
                ) {
                    VStack(spacing: 12) {
                        Button(action: {}) {
                            Text("Large Button")
                        }
                        .primaryButtonStyle(size: .large)
                        
                        Button(action: {}) {
                            Text("Medium Button")
                        }
                        .primaryButtonStyle(size: .medium)
                        
                        Button(action: {}) {
                            Text("Small Button")
                        }
                        .primaryButtonStyle(size: .small)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
    
    @ViewBuilder
    private func buttonSection<Content: View>(
        title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            content()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    ButtonShowcase()
}

