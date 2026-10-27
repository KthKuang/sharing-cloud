#if canImport(AppKit) || canImport(UIKit) || canImport(WatchKit)
  import ConcurrencyExtras
  import Dependencies
  import Foundation
  import IssueReporting
  import Sharing

  #if canImport(AppKit)
    import AppKit
  #endif
  #if canImport(UIKit)
    import UIKit
  #endif
  #if canImport(WatchKit)
    import WatchKit
  #endif

  extension SharedReaderKey {
    /// Creates a shared key that can read and write to a boolean iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Bool> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an integer iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Int> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to a double iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Double> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to a string iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<String> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to a string array iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<[String]> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to a URL iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<URL> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an iCloud key-value store as data.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Data> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to a date iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Date> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write a codable value to an iCloud key-value store.
    ///
    /// The value is stored as JSON-encoded data. Note that the iCloud key-value store limits
    /// values to 1 MB per key (and 1 MB / 1,024 keys in total).
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    @_disfavoredOverload
    public static func iCloudKV<Value: Codable>(
      _ key: String,
      store: NSUbiquitousKeyValueStore? = nil
    ) -> Self
    where Self == iCloudKVKey<Value> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an integer iCloud key-value store,
    /// transforming that to a `RawRepresentable` data type.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV<Value: RawRepresentable<Int>>(
      _ key: String,
      store: NSUbiquitousKeyValueStore? = nil
    ) -> Self
    where Self == iCloudKVKey<Value> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to a string iCloud key-value store,
    /// transforming that to a `RawRepresentable` data type.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV<Value: RawRepresentable<String>>(
      _ key: String,
      store: NSUbiquitousKeyValueStore? = nil
    ) -> Self
    where Self == iCloudKVKey<Value> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional boolean iCloud key-value
    /// store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Bool?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional integer iCloud key-value
    /// store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Int?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional double iCloud key-value
    /// store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Double?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional string iCloud key-value
    /// store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<String?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional string array iCloud key-value
    /// store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<[String]?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional URL iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<URL?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an iCloud key-value store as optional
    /// data.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Data?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional date iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String, store: NSUbiquitousKeyValueStore? = nil) -> Self
    where Self == iCloudKVKey<Date?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write an optional codable value to an iCloud
    /// key-value store.
    ///
    /// The value is stored as JSON-encoded data. Note that the iCloud key-value store limits
    /// values to 1 MB per key (and 1 MB / 1,024 keys in total).
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    @_disfavoredOverload
    public static func iCloudKV<Value: Codable>(
      _ key: String,
      store: NSUbiquitousKeyValueStore? = nil
    ) -> Self
    where Self == iCloudKVKey<Value?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional integer iCloud key-value
    /// store, transforming that to a `RawRepresentable` data type.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV<Value: RawRepresentable>(
      _ key: String,
      store: NSUbiquitousKeyValueStore? = nil
    ) -> Self
    where Value.RawValue == Int, Self == iCloudKVKey<Value?> {
      iCloudKVKey(key, store: store)
    }

    /// Creates a shared key that can read and write to an optional string iCloud key-value
    /// store, transforming that to a `RawRepresentable` data type.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    ///   - store: The iCloud key-value store to read and write to. A value of `nil` will use the
    ///     store from dependencies.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV<Value: RawRepresentable>(
      _ key: String,
      store: NSUbiquitousKeyValueStore? = nil
    ) -> Self
    where Value.RawValue == String, Self == iCloudKVKey<Value?> {
      iCloudKVKey(key, store: store)
    }
  }

  /// A type defining an iCloud key-value store persistence strategy.
  // swift-format-ignore: TypeNamesShouldBeCapitalized
  public struct iCloudKVKey<Value: Sendable>: SharedKey {
    private let lookup: any Lookup<Value>
    private let key: String
    private let store: UncheckedSendable<NSUbiquitousKeyValueStore>

    public var id: iCloudKVKeyID {
      iCloudKVKeyID(key: key, store: store.wrappedValue)
    }

    private init(lookup: some Lookup<Value>, key: String, store: NSUbiquitousKeyValueStore?) {
      @Dependency(\.defaultiCloudKVStore) var defaultStore
      self.lookup = lookup
      self.key = key
      self.store = UncheckedSendable(store ?? defaultStore)

      // Check key length limitation
      if key.lengthOfBytes(using: .utf8) > 64 {
        @Dependency(\.iCloudKVWarningsEnabled) var warningsEnabled
        if warningsEnabled {
          reportIssue(
            """
            The maximum length for key strings for the iCloud key-value store is 64 bytes using \
            UTF8 encoding.
            Attempting to write a value to a longer key name results in a runtime error.
            Consider using a shorter key name.
            For details, visit https://developer.apple.com/documentation/foundation/nsubiquitouskeyvaluestore.
            """
          )
        }
      }
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Bool {
      self.init(lookup: CastableLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Int {
      self.init(lookup: CastableLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Double {
      self.init(lookup: CastableLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == String {
      self.init(lookup: CastableLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == [String] {
      self.init(lookup: CastableLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == URL {
      self.init(lookup: URLLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Data {
      self.init(lookup: CastableLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Date {
      self.init(lookup: CastableLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value: Codable {
      self.init(lookup: CodableLookup(), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?)
    where Value: RawRepresentable<Int> {
      self.init(lookup: RawRepresentableLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?)
    where Value: RawRepresentable<String> {
      self.init(lookup: RawRepresentableLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Bool? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Int? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Double? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == String? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == [String]? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == URL? {
      self.init(lookup: OptionalLookup(base: URLLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Data? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init(_ key: String, store: NSUbiquitousKeyValueStore?) where Value == Date? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key, store: store)
    }

    fileprivate init<C: Codable>(_ key: String, store: NSUbiquitousKeyValueStore?)
    where Value == C? {
      self.init(
        lookup: OptionalLookup(base: CodableLookup()),
        key: key,
        store: store
      )
    }

    fileprivate init<R: RawRepresentable<Int>>(_ key: String, store: NSUbiquitousKeyValueStore?)
    where Value == R? {
      self.init(
        lookup: OptionalLookup(base: RawRepresentableLookup(base: CastableLookup())),
        key: key,
        store: store
      )
    }

    fileprivate init<R: RawRepresentable<String>>(
      _ key: String,
      store: NSUbiquitousKeyValueStore?
    )
    where Value == R? {
      self.init(
        lookup: OptionalLookup(base: RawRepresentableLookup(base: CastableLookup())),
        key: key,
        store: store
      )
    }

    public func load(context: LoadContext<Value>, continuation: LoadContinuation<Value>) {
      store.wrappedValue.synchronize()
      continuation.resume(with: .success(lookupValue(default: context.initialValue)))
    }

    public func subscribe(
      context: LoadContext<Value>, subscriber: SharedSubscriber<Value>
    ) -> SharedSubscription {
      @Dependency(\.iCloudKVWarningsEnabled) var iCloudKVWarningsEnabled
      let warningsEnabled = iCloudKVWarningsEnabled
      let previousValue = Mutex(context.initialValue)
      let store = store

      // Register for iCloud key-value store changes
      nonisolated(unsafe) let iCloudStoreDidChange = NotificationCenter.default.addObserver(
        forName: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
        object: store.wrappedValue,
        queue: nil
      ) { notification in
        guard
          !notification.hasExceededQuota
        else {
          if warningsEnabled {
            reportIssue(
              """
              Your app's key-value store has exceeded its space quota on the iCloud server.
              The total amount of space available in your app’s key-value store, for a given \
              user, is 1 MB. There is a per-key value size limit of 1 MB, and a maximum of 1024 \
              keys. If you attempt to write data that exceeds these quotas, the write attempt \
              fails and no change is made to your iCloud key-value storage.
              For details, visit https://developer.apple.com/documentation/foundation/nsubiquitouskeyvaluestore.
              """
            )
          }
          subscriber.yield(throwing: iCloudKVQuotaError())
          return
        }

        // Check if the key is in the changed keys
        guard
          notification.changedKeys.contains(key)
        else {
          return
        }

        let newValue = lookupValue(default: context.initialValue)
        defer { previousValue.withLock { $0 = newValue } }

        /// Check if the value has changed
        func isEqual<T>(_ lhs: T, _ rhs: T) -> Bool? {
          func open<U: Equatable>(_ lhs: U) -> Bool {
            lhs == rhs as? U
          }
          guard let lhs = lhs as? any Equatable else { return nil }
          return open(lhs)
        }

        guard
          !(isEqual(newValue, previousValue.withLock { $0 }) ?? false)
            || (isEqual(newValue, context.initialValue) ?? true)
        else {
          return
        }

        guard !SharediCloudKVLocals.isSetting
        else { return }

        DispatchQueue.main.async {
          subscriber.yield(with: .success(newValue))
        }
      }

      if !store.wrappedValue.synchronize() {
        if warningsEnabled {
          reportIssue(
            """
            Failed to synchronize iCloud key-value store.
            The app may not have been built with the correct entitlement requests.
            For details, visit https://developer.apple.com/documentation/foundation/nsubiquitouskeyvaluestore/1415989-synchronize
            """
          )
        }
      }

      // Also refresh on application becoming active
      nonisolated(unsafe) let willEnterForeground: (any NSObjectProtocol)?
      if let willEnterForegroundNotificationName {
        willEnterForeground = NotificationCenter.default.addObserver(
          forName: willEnterForegroundNotificationName,
          object: nil,
          queue: .main
        ) { _ in
          store.wrappedValue.synchronize()
        }
      } else {
        willEnterForeground = nil
      }

      return SharedSubscription {
        NotificationCenter.default.removeObserver(iCloudStoreDidChange)
        if let willEnterForeground {
          NotificationCenter.default.removeObserver(willEnterForeground)
        }
      }
    }

    public func save(_ value: Value, context _: SaveContext, continuation: SaveContinuation) {
      lookup.saveValue(value, to: store.wrappedValue, at: key)
      continuation.resume()
    }

    private func lookupValue(default initialValue: Value?) -> Value? {
      lookup.loadValue(from: store.wrappedValue, at: key, default: initialValue)
    }
  }

  extension iCloudKVKey: CustomStringConvertible {
    public var description: String {
      ".iCloudKV(\(String(reflecting: key)), store: \(store.wrappedValue))"
    }
  }

  // swift-format-ignore: TypeNamesShouldBeCapitalized
  public struct iCloudKVKeyID: Hashable {
    fileprivate let key: String
    fileprivate let store: NSUbiquitousKeyValueStore
  }

  /// An error indicating that the app's key-value store has exceeded its space quota on the
  /// iCloud server.
  ///
  /// This error is surfaced through the shared value's `loadError` when the iCloud key-value
  /// store reports a quota violation. Because the quota is a store-wide condition, every shared
  /// value subscribed to the affected store receives this error, not just the key whose write
  /// exceeded the quota. The error clears the next time the value changes successfully.
  // swift-format-ignore: TypeNamesShouldBeCapitalized
  public struct iCloudKVQuotaError: Error, Equatable {
    public init() {}
  }

  extension DependencyValues {
    /// Default iCloud key-value store used by `SharedReaderKey.iCloudKV`.
    ///
    /// Use this dependency to override the store that `iCloudKV` shared keys read from and
    /// write to. The live value is `NSUbiquitousKeyValueStore.default`; tests and previews use
    /// an in-memory store instead, so that they never talk to the real iCloud server and do not
    /// require iCloud entitlements.
    ///
    /// For example, while your app is running for UI tests you probably do not want data
    /// bleeding into the user's real iCloud key-value store:
    ///
    /// ```swift
    /// import Dependencies
    /// import SharingCloud
    /// import SwiftUI
    ///
    /// @main
    /// struct MyApp: App {
    ///   init() {
    ///     if ProcessInfo.processInfo.environment["UITesting"] == "true" {
    ///       prepareDependencies {
    ///         $0.defaultiCloudKVStore = .inMemory
    ///       }
    ///     }
    ///   }
    ///   // ...
    /// }
    /// ```
    public var defaultiCloudKVStore: NSUbiquitousKeyValueStore {
      get { self[DefaultStoreKey.self].value }
      set { self[DefaultStoreKey.self] = UncheckedSendable(newValue) }
    }

    /// Whether `iCloudKV` shared keys report configuration issues via `reportIssue`.
    ///
    /// Gates the warnings for over-long key names (more than 64 UTF-8 bytes), missing iCloud
    /// entitlements, and exceeded quotas. Defaults to `true`. The value is captured when a
    /// shared key is created or subscribes; changing it later does not affect existing
    /// subscriptions. If you cannot control these
    /// conditions and want to silence the warnings, override this dependency at the entry point
    /// of your application:
    ///
    /// ```swift
    /// prepareDependencies {
    ///   $0.iCloudKVWarningsEnabled = false
    /// }
    /// ```
    public var iCloudKVWarningsEnabled: Bool {
      get { self[WarningsEnabledKey.self] }
      set { self[WarningsEnabledKey.self] = newValue }
    }
  }

  private enum DefaultStoreKey: DependencyKey {
    static var liveValue: UncheckedSendable<NSUbiquitousKeyValueStore> {
      UncheckedSendable(.default)
    }

    static var previewValue: UncheckedSendable<NSUbiquitousKeyValueStore> {
      UncheckedSendable(.inMemory)
    }

    static var testValue: UncheckedSendable<NSUbiquitousKeyValueStore> {
      UncheckedSendable(.inMemory)
    }
  }

  private enum WarningsEnabledKey: DependencyKey {
    static let liveValue = true
    static let testValue = true
  }

  /// For local state tracking
  private enum SharediCloudKVLocals {
    @TaskLocal static var isSetting = false
  }

  /// Lookup protocol for NSUbiquitousKeyValueStore
  private protocol Lookup<Value>: Sendable {
    associatedtype Value: Sendable
    func loadValue(
      from store: NSUbiquitousKeyValueStore,
      at key: String,
      default defaultValue: Value?
    ) -> Value?
    func saveValue(_ newValue: Value, to store: NSUbiquitousKeyValueStore, at key: String)
  }

  private struct CastableLookup<Value: Sendable>: Lookup {
    func loadValue(
      from store: NSUbiquitousKeyValueStore,
      at key: String,
      default defaultValue: Value?
    ) -> Value? {
      guard let value = store.object(forKey: key) as? Value
      else {
        guard !SharediCloudKVLocals.isSetting
        else { return nil }

        SharediCloudKVLocals.$isSetting.withValue(true) {
          store.set(defaultValue, forKey: key)
        }
        return nil
      }
      return value
    }

    func saveValue(_ newValue: Value, to store: NSUbiquitousKeyValueStore, at key: String) {
      SharediCloudKVLocals.$isSetting.withValue(true) {
        store.set(newValue, forKey: key)
      }
    }
  }

  private struct CodableLookup<Value: Codable & Sendable>: Lookup {
    func loadValue(
      from store: NSUbiquitousKeyValueStore,
      at key: String,
      default defaultValue: Value?
    ) -> Value? {
      guard let data = store.data(forKey: key)
      else {
        guard !SharediCloudKVLocals.isSetting
        else { return nil }

        SharediCloudKVLocals.$isSetting.withValue(true) {
          if let value = defaultValue, !isNil(value),
            let encoded = try? JSONEncoder().encode(value)
          {
            store.set(encoded, forKey: key)
          }
        }
        return nil
      }
      return try? JSONDecoder().decode(Value.self, from: data)
    }

    func saveValue(_ newValue: Value, to store: NSUbiquitousKeyValueStore, at key: String) {
      SharediCloudKVLocals.$isSetting.withValue(true) {
        if isNil(newValue) {
          store.removeObject(forKey: key)
        } else if let encoded = try? JSONEncoder().encode(newValue) {
          store.set(encoded, forKey: key)
        }
      }
    }

    /// Overload resolution binds optional codable types to this lookup with `Value` itself
    /// being `Optional`, so `nil` must be detected at runtime and clear the key — persisting
    /// JSON `null` would diverge from every other optional strategy, which removes the key.
    private func isNil(_ value: Value) -> Bool {
      (value as? any AnyOptional)?.isNil ?? false
    }
  }

  private protocol AnyOptional {
    var isNil: Bool { get }
  }

  extension Optional: AnyOptional {
    fileprivate var isNil: Bool {
      self == nil
    }
  }

  private struct URLLookup: Lookup {
    typealias Value = URL

    func loadValue(
      from store: NSUbiquitousKeyValueStore, at key: String, default defaultValue: URL?
    ) -> URL? {
      guard let stringValue = store.string(forKey: key), let url = URL(string: stringValue)
      else {
        guard !SharediCloudKVLocals.isSetting
        else { return nil }

        SharediCloudKVLocals.$isSetting.withValue(true) {
          store.set(defaultValue?.absoluteString, forKey: key)
        }
        return nil
      }
      return url
    }

    func saveValue(_ newValue: URL, to store: NSUbiquitousKeyValueStore, at key: String) {
      SharediCloudKVLocals.$isSetting.withValue(true) {
        store.set(newValue.absoluteString, forKey: key)
      }
    }
  }

  private struct RawRepresentableLookup<Value: RawRepresentable & Sendable, Base: Lookup>: Lookup
  where Value.RawValue == Base.Value {
    let base: Base
    func loadValue(
      from store: NSUbiquitousKeyValueStore, at key: String, default defaultValue: Value?
    ) -> Value? {
      base.loadValue(from: store, at: key, default: defaultValue?.rawValue)
        .flatMap(Value.init(rawValue:))
    }

    func saveValue(_ newValue: Value, to store: NSUbiquitousKeyValueStore, at key: String) {
      base.saveValue(newValue.rawValue, to: store, at: key)
    }
  }

  private struct OptionalLookup<Base: Lookup>: Lookup {
    let base: Base
    func loadValue(
      from store: NSUbiquitousKeyValueStore, at key: String, default defaultValue: Base.Value??
    ) -> Base.Value?? {
      base.loadValue(from: store, at: key, default: defaultValue ?? nil)
        .flatMap(Optional.some)
        ?? .none
    }

    func saveValue(_ newValue: Base.Value?, to store: NSUbiquitousKeyValueStore, at key: String) {
      if let newValue {
        base.saveValue(newValue, to: store, at: key)
      } else {
        SharediCloudKVLocals.$isSetting.withValue(true) {
          store.removeObject(forKey: key)
        }
      }
    }
  }

  private let willEnterForegroundNotificationName: Notification.Name? = {
    #if os(macOS)
      return NSApplication.willBecomeActiveNotification
    #elseif os(iOS) || os(tvOS) || os(visionOS)
      return UIApplication.willEnterForegroundNotification
    #elseif os(watchOS)
      if #available(watchOS 7, *) {
        return WKApplication.willEnterForegroundNotification
      } else {
        return nil
      }
    #else
      return nil
    #endif
  }()

  extension Notification {
    fileprivate var changedKeys: [String] {
      guard
        let userInfo = userInfo,
        let value = userInfo[NSUbiquitousKeyValueStoreChangedKeysKey],
        let keys = value as? [String]
      else {
        return []
      }
      return keys
    }

    fileprivate var hasExceededQuota: Bool {
      guard
        let userInfo = userInfo,
        let changeReason = userInfo[NSUbiquitousKeyValueStoreChangeReasonKey],
        let reason = changeReason as? Int
      else {
        return false
      }
      switch reason {
      case NSUbiquitousKeyValueStoreServerChange:
        return false
      case NSUbiquitousKeyValueStoreInitialSyncChange:
        return false
      case NSUbiquitousKeyValueStoreQuotaViolationChange:
        return true
      case NSUbiquitousKeyValueStoreAccountChange:
        return false
      default:
        return false
      }
    }
  }
#endif
