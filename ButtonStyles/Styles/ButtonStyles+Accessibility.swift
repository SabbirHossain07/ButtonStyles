//
//  ButtonStyles+Accessibility.swift
//  ButtonStyles
//
//  Accessibility enhancements for button styles
//

import SwiftUI

// MARK: - Accessibility Extensions

extension View {
    /// Adds accessibility large content support for buttons
    /// - Parameters:
    ///   - title: The button title for accessibility
    ///   - hint: Optional accessibility hint
    ///   - value: Optional accessibility value
    /// - Returns: Modified view with accessibility enhancements
    func buttonAccessibility(
        title: String,
        hint: String? = nil,
        value: String? = nil
    ) -> some View {
        self
            .accessibilityLabel(title)
            .accessibilityHint(hint ?? "")
            .accessibilityValue(value ?? "")
            .accessibilityAddTraits(.isButton)
            .accessibilityElement(children: .combine)
            .imageScale(.large)
    }
}

// MARK: - Large Content Viewer Support

struct LargeContentButton: View {
    let title: String
    let icon: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .imageScale(.large)
                }
                Text(title)
                    .font(.body)
            }
        }
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
    }
}

#if os(iOS)
extension View {
    /// Adds large content viewer support for buttons with icons
    /// This is particularly useful for icon buttons when users prefer larger text
    func largeContentViewer(icon: String, title: String) -> some View {
        self
            .accessibilityLabel(title)
            .accessibilityHint("Double tap to activate")
            .imageScale(.large)
    }
}
#endif

