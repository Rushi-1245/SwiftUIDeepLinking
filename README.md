# SwiftUI Deep Linking

A beginner-friendly SwiftUI project demonstrating how to implement **Deep Linking** using **Custom URL Schemes** and **Universal Links** with `NavigationStack`.

The project focuses on clean, easy-to-understand code rather than production-level architecture, making it suitable for learning and showcasing SwiftUI navigation.

---

## Features

- Custom URL Scheme support
- Universal Link support
- Type-safe routing using `NavigationStack`
- Dedicated Deep Link parser
- Clean project structure
- Reusable navigation logic
- Simple and beginner-friendly implementation
- Supports multiple destinations

---

# Supported Deep Links

## Custom URL Scheme

```
deeplink://product/101
```

```
deeplink://profile/john
```

```
deeplink://settings
```

---

## Universal Links

```
https://test.com/product/101
```

```
https://test.com/profile/john
```

```
https://test.com/settings
```

---

# Project Flow

```
Incoming URL
      │
      ▼
onOpenURL
      │
      ▼
AppRouter
      │
      ▼
DeepLinkParser
      │
      ▼
Route
      │
      ▼
NavigationStack
      │
      ▼
Destination View
```

---

# How It Works

### 1. User opens a Deep Link

Example:

```
deeplink://product/101
```

or

```
https://test.com/product/101
```

---

### 2. SwiftUI receives the URL

The application listens for incoming URLs using:

```swift
.onOpenURL { url in
    router.handle(url: url)
}
```

---

### 3. AppRouter

The router receives the URL and asks the parser to determine which screen should be opened.

---

### 4. DeepLinkParser

The parser extracts:

- URL Scheme
- Host
- Path
- Parameters

and converts them into a type-safe `Route`.

---

### 5. NavigationStack

The generated route is pushed into the `NavigationStack`, automatically navigating to the correct screen.

---

# Screens

The project currently supports three destinations:

- Home
- Product
- Profile
- Settings

---

# Testing

## Custom URL Schemes

Run the application in the iOS Simulator and execute:

### Product

```bash
xcrun simctl openurl booted deeplink://product/101
```

### Profile

```bash
xcrun simctl openurl booted deeplink://profile/john
```

### Settings

```bash
xcrun simctl openurl booted deeplink://settings
```

---

## Universal Links

The routing logic for Universal Links is fully implemented.

Example URLs:

```
https://test.com/product/101
```

```
https://test.com/profile/john
```

```
https://test.com/settings
```

### Note

Universal Links require:

- Apple Developer Team ID
- Associated Domains capability
- A valid provisioning profile
- A hosted `apple-app-site-association` file
- A verified HTTPS domain

Since this repository is intended as a learning project, the complete implementation is included, but end-to-end testing requires an Apple Developer account and a configured domain.

---

# apple-app-site-association

Example configuration:

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "TEAM_ID.com.test.SwiftUIDeepLinking",
        "paths": [
          "/",
          "/settings",
          "/product/*",
          "/profile/*"
        ]
      }
    ]
  }
}
```

Replace:

```
TEAM_ID
```

with your Apple Developer Team ID.

---

# Configure URL Scheme

Open:

```
Target
→ Info
→ URL Types
```

Add:

```
Identifier

com.test.SwiftUIDeepLinking
```

Scheme

```
deeplink
```

---

# Configure Associated Domains

Open:

```
Target

Signing & Capabilities

Associated Domains
```

Add:

```
applinks:test.com
```

Replace **test.com** with your own domain.

---

# Technologies Used

- Swift
- SwiftUI
- NavigationStack
- URLComponents
- ObservableObject
- NavigationPath
- Universal Links
- Custom URL Schemes

---

# Learning Objectives

This project demonstrates:

- Deep Linking fundamentals
- URL parsing
- Type-safe navigation
- NavigationStack
- Universal Link configuration
- Custom URL Schemes
- Route-based navigation
- Clean code organization

---

# Future Improvements

Some ideas for extending this project:

- Authentication before navigation
- Deferred Deep Linking
- Query parameter support
- Notification Deep Links
- Dynamic Links
- Coordinator pattern integration
- Unit tests for `DeepLinkParser`
- Error screen for unsupported links

---

# Screenshots

Add screenshots here after running the project.

<p align="center">
<img width="500" height="1100" alt="simulator_screenshot_B84029EB-A950-41F4-9833-190BA3CE951F" src="https://github.com/user-attachments/assets/28e19452-f4ba-49c5-9258-35324bd8659c" />
</p>

<p align="center">
<img width="500" height="1100" alt="simulator_screenshot_CDBB4750-A9CF-4EF1-A8C1-26A3499410B3" src="https://github.com/user-attachments/assets/4ddae860-0bdf-4596-8b5c-5da63c1f6112" />
</p>

<p align="center">
<img width="500" height="1100" alt="simulator_screenshot_D95AC7D9-5C9E-4237-B779-5EB48ACCA0F1" src="https://github.com/user-attachments/assets/9e4e34cd-3084-4d3b-b2da-f8ccfe969a0e" />
</p>

<p align="center">
<img width="500" height="1100" alt="simulator_screenshot_54A89752-1D75-4DBD-8F91-931D108368F4" src="https://github.com/user-attachments/assets/193c75ff-a81d-4163-a546-4c9e318b04e1" />
</p>

---

# Requirements

- Xcode 16+
- iOS 17+
- Swift 6

---

# Author

**Rushikesh Gaikwad**

If you found this project helpful, consider giving it a ⭐ on GitHub.
