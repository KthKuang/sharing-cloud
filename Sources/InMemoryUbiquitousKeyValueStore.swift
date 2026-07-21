#if canImport(AppKit) || canImport(UIKit) || canImport(WatchKit)
  import Foundation

  extension NSUbiquitousKeyValueStore {
    /// An iCloud key-value store that holds its data in memory instead of on the iCloud server.
    ///
    /// A brand new, empty store is created every time this property is accessed. It is the
    /// default store in tests and previews (see the `defaultiCloudKVStore` dependency), and can
    /// also be passed explicitly to `.iCloudKV(_:store:)` for isolated storage.
    ///
    /// Direct writes to the store post `didChangeExternallyNotification` locally, so they behave
    /// like external iCloud changes: shared values observing the store update automatically.
    public static var inMemory: NSUbiquitousKeyValueStore {
      InMemoryUbiquitousKeyValueStore()
    }
  }

  private final class InMemoryUbiquitousKeyValueStore: NSUbiquitousKeyValueStore,
    @unchecked Sendable
  {
    private let lock = NSLock()
    private nonisolated(unsafe) var storage: [String: Any] = [:]

    override var dictionaryRepresentation: [String: Any] {
      lock.withLock { storage }
    }

    override func object(forKey aKey: String) -> Any? {
      lock.withLock { storage[aKey] }
    }

    override func set(_ anObject: Any?, forKey aKey: String) {
      lock.withLock { storage[aKey] = anObject }
      postDidChangeExternally(changedKey: aKey)
    }

    override func removeObject(forKey aKey: String) {
      lock.withLock { storage[aKey] = nil }
      postDidChangeExternally(changedKey: aKey)
    }

    private func postDidChangeExternally(changedKey: String) {
      NotificationCenter.default.post(
        name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
        object: self,
        userInfo: [
          NSUbiquitousKeyValueStoreChangedKeysKey: [changedKey],
          NSUbiquitousKeyValueStoreChangeReasonKey: NSUbiquitousKeyValueStoreServerChange,
        ]
      )
    }

    override func string(forKey aKey: String) -> String? {
      object(forKey: aKey) as? String
    }

    override func array(forKey aKey: String) -> [Any]? {
      object(forKey: aKey) as? [Any]
    }

    override func dictionary(forKey aKey: String) -> [String: Any]? {
      object(forKey: aKey) as? [String: Any]
    }

    override func data(forKey aKey: String) -> Data? {
      object(forKey: aKey) as? Data
    }

    override func longLong(forKey aKey: String) -> Int64 {
      (object(forKey: aKey) as? NSNumber)?.int64Value ?? 0
    }

    override func double(forKey aKey: String) -> Double {
      (object(forKey: aKey) as? NSNumber)?.doubleValue ?? 0
    }

    override func bool(forKey aKey: String) -> Bool {
      (object(forKey: aKey) as? NSNumber)?.boolValue ?? false
    }

    override func set(_ value: Bool, forKey aKey: String) {
      set(NSNumber(value: value), forKey: aKey)
    }

    override func set(_ value: Double, forKey aKey: String) {
      set(NSNumber(value: value), forKey: aKey)
    }

    override func set(_ value: Int64, forKey aKey: String) {
      set(NSNumber(value: value), forKey: aKey)
    }

    override func set(_ aString: String?, forKey aKey: String) {
      set(aString as Any?, forKey: aKey)
    }

    override func set(_ aData: Data?, forKey aKey: String) {
      set(aData as Any?, forKey: aKey)
    }

    override func set(_ anArray: [Any]?, forKey aKey: String) {
      set(anArray as Any?, forKey: aKey)
    }

    override func set(_ aDictionary: [String: Any]?, forKey aKey: String) {
      set(aDictionary as Any?, forKey: aKey)
    }

    override func synchronize() -> Bool {
      true
    }
  }
#endif
