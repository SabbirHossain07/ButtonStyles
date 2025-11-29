# Usage Guide

This guide provides detailed examples and best practices for using Button Styles Pack in your SwiftUI applications.

## Table of Contents

- [Basic Usage](#basic-usage)
- [Button Styles](#button-styles)
- [Icon Buttons](#icon-buttons)
- [Loading States](#loading-states)
- [Best Practices](#best-practices)
- [Advanced Examples](#advanced-examples)

## Basic Usage

### Import the Library

```swift
import SwiftUI
// Button styles are included in your project
```

### Simple Button

```swift
Button("Tap Me") {
    print("Button tapped!")
}
.primaryButtonStyle()
```

## Button Styles

### Primary Buttons

Primary buttons are used for the main action in a view.

```swift
Button("Save Changes") {
    saveChanges()
}
.primaryButtonStyle(size: .large)
```

### Secondary Buttons

Secondary buttons are used for secondary actions.

```swift
Button("Cancel") {
    dismiss()
}
.secondaryButtonStyle()
```

### Tertiary Buttons

Tertiary buttons are used for less prominent actions.

```swift
Button("Learn More") {
    showMoreInfo()
}
.tertiaryButtonStyle()
```

## Icon Buttons

### Standalone Icon Buttons

Perfect for toolbars, navigation bars, or compact interfaces.

```swift
HStack {
    IconButton(
        icon: "heart.fill",
        action: { toggleFavorite() },
        size: .medium,
        style: .primary
    )
    
    IconButton(
        icon: "square.and.arrow.up.fill",
        action: { shareContent() },
        size: .medium,
        style: .secondary
    )
}
```

### Icon + Text Buttons

When you need both icon and text for clarity.

```swift
IconTextButton(
    icon: "arrow.right",
    title: "Continue",
    action: { navigateNext() },
    size: .large,
    style: .primary,
    iconPosition: .trailing
)
```

## Loading States

### Basic Loading State

```swift
@State private var isSaving = false

Button("Save") {
    isSaving = true
    Task {
        await saveData()
        isSaving = false
    }
}
.primaryButtonStyle(isLoading: isSaving)
```

### Loading with Multiple Buttons

```swift
@State private var primaryLoading = false
@State private var secondaryLoading = false

VStack {
    Button("Primary Action") {
        primaryLoading = true
        performPrimaryAction()
    }
    .primaryButtonStyle(isLoading: primaryLoading)
    
    Button("Secondary Action") {
        secondaryLoading = true
        performSecondaryAction()
    }
    .secondaryButtonStyle(isLoading: secondaryLoading)
}
```

### Async Operations with Loading

```swift
@State private var isLoading = false

Button("Fetch Data") {
    Task {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let data = try await fetchDataFromAPI()
            processData(data)
        } catch {
            handleError(error)
        }
    }
}
.gradientButtonStyle(isLoading: isLoading)
```

## Best Practices

### 1. Button Hierarchy

Use button styles to establish a visual hierarchy:

```swift
VStack(spacing: 16) {
    // Primary action
    Button("Confirm Order") {
        confirmOrder()
    }
    .primaryButtonStyle(size: .large)
    
    // Secondary action
    Button("Edit Items") {
        editItems()
    }
    .secondaryButtonStyle()
    
    // Tertiary action
    Button("Cancel") {
        cancel()
    }
    .tertiaryButtonStyle()
}
```

### 2. Size Consistency

Use consistent sizes throughout your app:

```swift
// Use .large for primary CTAs
Button("Get Started") { }
    .primaryButtonStyle(size: .large)

// Use .medium for most buttons
Button("Continue") { }
    .primaryButtonStyle(size: .medium)

// Use .small for compact spaces
Button("Skip") { }
    .tertiaryButtonStyle(size: .small)
```

### 3. Loading State Management

Always disable interaction during loading:

```swift
@State private var isLoading = false

Button("Submit") {
    isLoading = true
    // Button is automatically disabled when isLoading is true
}
.primaryButtonStyle(isLoading: isLoading)
// No need to manually add .disabled(isLoading)
```

### 4. Accessibility

Add accessibility labels for better VoiceOver support:

```swift
Button("Delete") {
    deleteItem()
}
.primaryButtonStyle()
.accessibilityLabel("Delete item")
.accessibilityHint("Double tap to permanently delete this item")
```

### 5. Gradient Customization

Use gradients that match your app's color scheme:

```swift
Button("Premium Feature") {
    unlockPremium()
}
.gradientButtonStyle(
    colors: [
        Color.purple,
        Color.pink,
        Color.orange
    ]
)
```

### 6. Glassmorphism with Backgrounds

Glassmorphism works best with colorful backgrounds:

```swift
ZStack {
    // Background gradient
    LinearGradient(
        colors: [Color.blue, Color.purple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    VStack {
        Button("Glass Button") {
            performAction()
        }
        .glassmorphismButtonStyle(size: .large)
    }
}
```

## Advanced Examples

### Form with Multiple Buttons

```swift
Form {
    Section {
        TextField("Name", text: $name)
        TextField("Email", text: $email)
    }
    
    Section {
        Button("Save Profile") {
            saveProfile()
        }
        .primaryButtonStyle()
        
        Button("Reset") {
            resetForm()
        }
        .secondaryButtonStyle()
    }
}
```

### Card with Action Buttons

```swift
VStack(alignment: .leading, spacing: 16) {
    Text("Product Name")
        .font(.title)
    
    Text("Product description...")
        .foregroundColor(.secondary)
    
    HStack(spacing: 12) {
        Button("Add to Cart") {
            addToCart()
        }
        .primaryButtonStyle()
        
        IconButton(
            icon: "heart.fill",
            action: { toggleFavorite() },
            size: .medium
        )
    }
}
.padding()
.background(Color(.systemBackground))
.cornerRadius(12)
```

### Modal with Buttons

```swift
VStack(spacing: 24) {
    Text("Delete Item?")
        .font(.title2)
        .fontWeight(.bold)
    
    Text("This action cannot be undone.")
        .foregroundColor(.secondary)
    
    HStack(spacing: 12) {
        Button("Cancel") {
            dismiss()
        }
        .secondaryButtonStyle()
        
        Button("Delete") {
            deleteItem()
        }
        .primaryButtonStyle()
    }
}
.padding()
```

### Toolbar with Icon Buttons

```swift
Toolbar {
    ToolbarItem(placement: .navigationBarTrailing) {
        HStack {
            IconButton(
                icon: "magnifyingglass",
                action: { showSearch() },
                size: .medium,
                style: .tertiary
            )
            
            IconButton(
                icon: "bell.fill",
                action: { showNotifications() },
                size: .medium,
                style: .tertiary
            )
        }
    }
}
```

## Tips and Tricks

1. **Combine Styles**: Mix different button styles for variety
2. **Use Loading States**: Always show loading state for async operations
3. **Consistent Sizing**: Stick to one or two button sizes per screen
4. **Accessibility First**: Always add accessibility labels
5. **Test on Devices**: Test buttons on different device sizes
6. **Dark Mode**: All styles automatically adapt to dark mode

---

For more examples, check out the `ButtonShowcase` view in the project!

