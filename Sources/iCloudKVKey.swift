#if canImport(AppKit) || canImport(UIKit) || canImport(WatchKit)
  import Dependencies
  import Foundation
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
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Bool> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an integer iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Int> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to a double iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Double> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to a string iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<String> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to a URL iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<URL> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an iCloud key-value store as data.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Data> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to a date iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Date> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an integer iCloud key-value store, transforming
    /// that to a `RawRepresentable` data type.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV<Value: RawRepresentable<Int>>(
      _ key: String
    ) -> Self
    where Self == iCloudKVKey<Value> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to a string iCloud key-value store, transforming
    /// that to a `RawRepresentable` data type.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV<Value: RawRepresentable<String>>(
      _ key: String
    ) -> Self
    where Self == iCloudKVKey<Value> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an optional boolean iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Bool?> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an optional integer iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Int?> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an optional double iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Double?> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an optional string iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<String?> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an optional URL iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<URL?> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an iCloud key-value store as optional data.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Data?> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an optional date iCloud key-value store.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV(_ key: String) -> Self
    where Self == iCloudKVKey<Date?> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to an integer iCloud key-value store, transforming
    /// that to an optional `RawRepresentable` data type.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV<Value: RawRepresentable>(
      _ key: String
    ) -> Self
    where Value.RawValue == Int, Self == iCloudKVKey<Value?> {
      iCloudKVKey(key)
    }

    /// Creates a shared key that can read and write to a string iCloud key-value store, transforming
    /// that to an optional `RawRepresentable` data type.
    ///
    /// - Parameters:
    ///   - key: The key to read and write the value to in the iCloud key-value store.
    /// - Returns: An iCloud key-value store shared key.
    public static func iCloudKV<Value: RawRepresentable>(
      _ key: String
    ) -> Self
    where Value.RawValue == String, Self == iCloudKVKey<Value?> {
      iCloudKVKey(key)
    }
  }

  /// A type defining an iCloud key-value store persistence strategy.
  // swift-format-ignore: TypeNamesShouldBeCapitalized
  public struct iCloudKVKey<Value: Sendable>: SharedKey {
    private let lookup: any Lookup<Value>
    private let key: String
    private nonisolated(unsafe) let store: NSUbiquitousKeyValueStore

    public var id: iCloudKVKeyID {
      iCloudKVKeyID(key: key)
    }

    private init(lookup: some Lookup<Value>, key: String) {
      self.lookup = lookup
      self.key = key

      // Check key length limitation
      if key.lengthOfBytes(using: .utf8) > 64 {
        reportIssue(
          """
          The maximum length for key strings for the iCloud key-value store is 64 bytes using UTF8 encoding.
          Attempting to write a value to a longer key name results in a runtime error.
          Consider using a shorter key name.
          For details, visit https://developer.apple.com/documentation/foundation/nsubiquitouskeyvaluestore.
          """
        )
      }

      store = .default
    }

    fileprivate init(_ key: String) where Value == Bool {
      self.init(lookup: CastableLookup(), key: key)
    }

    fileprivate init(_ key: String) where Value == Int {
      self.init(lookup: CastableLookup(), key: key)
    }

    fileprivate init(_ key: String) where Value == Double {
      self.init(lookup: CastableLookup(), key: key)
    }

    fileprivate init(_ key: String) where Value == String {
      self.init(lookup: CastableLookup(), key: key)
    }

    fileprivate init(_ key: String) where Value == URL {
      self.init(lookup: URLLookup(), key: key)
    }

    fileprivate init(_ key: String) where Value == Data {
      self.init(lookup: CastableLookup(), key: key)
    }

    fileprivate init(_ key: String) where Value == Date {
      self.init(lookup: CastableLookup(), key: key)
    }

    fileprivate init(_ key: String) where Value: RawRepresentable<Int> {
      self.init(lookup: RawRepresentableLookup(base: CastableLookup()), key: key)
    }

    fileprivate init(_ key: String) where Value: RawRepresentable<String> {
      self.init(lookup: RawRepresentableLookup(base: CastableLookup()), key: key)
    }

    fileprivate init(_ key: String) where Value == Bool? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key)
    }

    fileprivate init(_ key: String) where Value == Int? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key)
    }

    fileprivate init(_ key: String) where Value == Double? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key)
    }

    fileprivate init(_ key: String) where Value == String? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key)
    }

    fileprivate init(_ key: String) where Value == URL? {
      self.init(lookup: OptionalLookup(base: URLLookup()), key: key)
    }

    fileprivate init(_ key: String) where Value == Data? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key)
    }

    fileprivate init(_ key: String) where Value == Date? {
      self.init(lookup: OptionalLookup(base: CastableLookup()), key: key)
    }

    fileprivate init<R: RawRepresentable<Int>>(_ key: String)
    where Value == R? {
      self.init(
        lookup: OptionalLookup(base: RawRepresentableLookup(base: CastableLookup())),
        key: key
      )
    }

    fileprivate init<R: RawRepresentable<String>>(_ key: String)
    where Value == R? {
      self.init(
        lookup: OptionalLookup(base: RawRepresentableLookup(base: CastableLookup())),
        key: key
      )
    }

    public func load(context: LoadContext<Value>, continuation: LoadContinuation<Value>) {
      store.synchronize()
      continuation.resume(with: .success(lookupValue(default: context.initialValue)))
    }

    public func subscribe(
      context: LoadContext<Value>, subscriber: SharedSubscriber<Value>
    ) -> SharedSubscription {
      let previousValue = Mutex(context.initialValue)

      // Register for iCloud key-value store changes
      nonisolated(unsafe) let iCloudStoreDidChange = NotificationCenter.default.addObserver(
        forName: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
        object: store,
        queue: nil
      ) { notification in
        guard
          !notification.hasExceededQuota
        else {
          reportIssue(
            """
            Your app's key-value store has exceeded its space quota on the iCloud server.
            The total amount of space available in your app’s key-value store, for a given user, is 1 MB. There is a per-key value size limit of 1 MB, and a maximum of 1024 keys. If you attempt to write data that exceeds these quotas, the write attempt fails and no change is made to your iCloud key-value storage.
            For details, visit https://developer.apple.com/documentation/foundation/nsubiquitouskeyvaluestore.
            """
          )
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

      if !store.synchronize() {
        reportIssue(
          """
          Failed to synchronize iCloud key-value store.
          The app may not have been built with the correct entitlement requests.
          For details, visit https://developer.apple.com/documentation/foundation/nsubiquitouskeyvaluestore/1415989-synchronize
          """
        )
      }

      // Also refresh on application becoming active
      nonisolated(unsafe) let willEnterForeground: (any NSObjectProtocol)?
      if let willEnterForegroundNotificationName {
        willEnterForeground = NotificationCenter.default.addObserver(
          forName: willEnterForegroundNotificationName,
          object: nil,
          queue: .main
        ) { _ in
          store.synchronize()
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
      lookup.saveValue(value, to: store, at: key)
      continuation.resume()
    }

    private func lookupValue(default initialValue: Value?) -> Value? {
      lookup.loadValue(from: store, at: key, default: initialValue)
    }
  }

  extension iCloudKVKey: CustomStringConvertible {
    public var description: String {
      ".iCloudKV(\(String(reflecting: key)))"
    }
  }

  // swift-format-ignore: TypeNamesShouldBeCapitalized
  public struct iCloudKVKeyID: Hashable {
    fileprivate let key: String
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
        return defaultValue
      }
      return value
    }

    func saveValue(_ newValue: Value, to store: NSUbiquitousKeyValueStore, at key: String) {
      SharediCloudKVLocals.$isSetting.withValue(true) {
        store.set(newValue, forKey: key)
      }
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
        if let defaultValue {
          SharediCloudKVLocals.$isSetting.withValue(true) {
            store.set(defaultValue.absoluteString, forKey: key)
          }
        }
        return defaultValue
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
        return WKExtension.applicationWillEnterForegroundNotification
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
