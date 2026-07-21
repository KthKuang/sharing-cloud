# Sharing Cloud

A swift library that extends the [swift-sharing](https://github.com/pointfreeco/swift-sharing) library with support for iCloud key-value synchronization through NSUbiquitousKeyValueStore.

## Overview

SharingCloud provides a simple and elegant way to sync shared data across multiple Apple devices using iCloud's key-value store. The library implements the `SharedKey` protocol from the swift-sharing library, enabling you to use the `@Shared` property wrapper with iCloud as a persistence strategy.

## Features

- **Seamless iCloud Integration**: Automatically sync data between iOS, macOS, watchOS, and tvOS devices
- **Simple Property Wrapper Syntax**: Use the familiar `@Shared` syntax with the `.iCloudKV` storage strategy
- **Comprehensive Type Support**:
  - Primitives: Bool, Int, Double, String
  - Complex Types: URL, Data, Date, [String]
  - Any `Codable` type, stored as JSON-encoded data
  - Optional variants of all supported types
  - RawRepresentable types using Int or String as raw values
- **Automatic Change Detection**: Observes iCloud changes and updates UI automatically
- **Test & Preview Friendly**: Tests and previews automatically use an in-memory store — no
  iCloud entitlements required, no data bleeding into the real key-value store
- **Quota Error Reporting**: Surfaces iCloud quota violations through the shared value's
  `loadError` as a typed `iCloudKVQuotaError`
- **Entitlement Checking**: Checks for proper iCloud entitlements and triggers the warning by `reportIssue`
- **Key Length Validation**: Checks that the key is under the 64-byte limit and triggers the warning by `reportIssue`

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/KeithBird/sharing-cloud", from: "2.0.0")
]
```

Then add the product to any target that needs it:

```swift
.product(name: "SharingCloud", package: "sharing-cloud")
```

## Usage

### Basic Example

```swift
import SharingCloud

// In an ObservableObject or @Observable class
@Observable
class SettingsModel {
    @ObservationIgnored
    @Shared(.iCloudKV("userPreferences")) 
    var isDarkModeEnabled: Bool = false
    
    @ObservationIgnored
    @Shared(.iCloudKV("notificationsEnabled")) 
    var notificationsEnabled: Bool = true
    
    @ObservationIgnored
    @Shared(.iCloudKV("fontSize")) 
    var fontSize: Int = 14
}

// In a SwiftUI view
struct SettingsView: View {
    @Shared(.iCloudKV("userPreferences")) private var isDarkModeEnabled: Bool = false
    @Shared(.iCloudKV("notificationsEnabled")) private var notificationsEnabled: Bool = true
    @Shared(.iCloudKV("fontSize")) private var fontSize: Int = 14
    
    var body: some View {
        Form {
            Toggle("Dark Mode", isOn: $isDarkModeEnabled)
            Toggle("Notifications", isOn: $notificationsEnabled)
            Stepper("Font Size: \(fontSize)", value: $fontSize, in: 10...30)
        }
    }
}
```

### Using with RawRepresentable Types

```swift
enum Theme: String, Sendable {
    case light
    case dark
    case system
}

struct ThemeSettingsView: View {
    @Shared(.iCloudKV("appTheme")) private var theme: Theme = .system
    
    var body: some View {
        Picker("Theme", selection: $theme) {
            Text("Light").tag(Theme.light)
            Text("Dark").tag(Theme.dark)
            Text("System").tag(Theme.system)
        }
    }
}
```

### Storing Complex Types

Storing a URL example:

```swift
@Shared(.iCloudKV("lastVisitedURL")) var lastURL: URL?
```

Any `Codable` type is stored as JSON-encoded data. Mind the store's quotas — 1 MB per key,
1 MB total per user, and at most 1,024 keys — JSON blobs consume them quickly:

```swift
struct Preferences: Codable, Sendable {
  var fontSize = 14
  var showsSidebar = true
}

@Shared(.iCloudKV("preferences")) var preferences = Preferences()
```

### Type-Safe Keys with Defaults

Define a key once, together with its default, and use it with leading dot-syntax everywhere:

```swift
extension SharedKey where Self == iCloudKVKey<Bool>.Default {
  static var isDarkModeEnabled: Self {
    Self[.iCloudKV("isDarkModeEnabled"), default: false]
  }
}

@Shared(.isDarkModeEnabled) var isDarkModeEnabled
```

### Testing and Previews

In tests and previews the `defaultiCloudKVStore` dependency resolves to an in-memory store, so
features that use `.iCloudKV` never talk to the real iCloud server and require no entitlements.
You can also override the store explicitly — for example during UI tests:

```swift
import Dependencies

@main
struct MyApp: App {
  init() {
    if ProcessInfo.processInfo.environment["UITesting"] == "true" {
      prepareDependencies {
        $0.defaultiCloudKVStore = .inMemory
      }
    }
  }
  // ...
}
```

Or pass an isolated store to a single key with `.iCloudKV("key", store: .inMemory)`.

### Other Shared Use Casess

More examples can be found in the [swift-sharing documentation](https://swiftpackageindex.com/pointfreeco/swift-sharing/main/documentation/sharing/).

## Setting Up iCloud in Your App

1. In Xcode, select your target and navigate to "Signing & Capabilities"
2. Add the iCloud capability
3. Check "Key-value storage"
4. Ensure your app has the proper entitlements:
   - `com.apple.developer.ubiquity-kvstore-identifier`
5. Replace `$(CFBundleIdenfier)` with your key-value store ID (i.e. `$(TeamIdentifierPrefix)<your key-value_store ID>`).

For more information, please see: [Synchronizing App Preferences with iCloud](https://developer.apple.com/documentation/foundation/icloud/synchronizing_app_preferences_with_icloud)

## Limitations

- NSUbiquitousKeyValueStore has a maximum total storage size of 1MB per user
- Each key-value pair is limited to 1MB in size
- Maximum of 1024 keys allowed
- Keys can't be larger than 64 bytes using UTF-8 encoding
- Synchronization is not immediate; iCloud syncs on its own schedule

## Best Practices

- Use short, descriptive key names to stay under the 64-byte limit
- Store only small pieces of data like preferences and settings
- Do not store sensitive user information in iCloud key-value store
- Check for iCloud availability before assuming data will be synced

## License

This library is available under the MIT license.
