import Dependencies
import Foundation
import Sharing
import SharingCloud
import Testing

extension SharedKey where Self == iCloudKVKey<Bool>.Default {
  fileprivate static var isTestFlagOn: Self {
    Self[.iCloudKV("isTestFlagOn"), default: true]
  }
}

struct SharingCloudTests {
  @Test
  func defaultValueWhenStoreIsEmpty() {
    @Shared(.iCloudKV("defaultValueWhenStoreIsEmpty")) var isOn = true
    #expect(isOn == true)
  }

  @Test
  func seedsDefaultIntoStoreOnFirstLoad() {
    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("seedsDefault")) var isOn = true
    #expect(store.object(forKey: "seedsDefault") as? Bool == true)
  }

  @Test
  func writePersistsToStore() {
    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("writePersists")) var count = 0
    $count.withLock { $0 = 42 }
    #expect(store.object(forKey: "writePersists") as? Int == 42)
  }

  @Test
  func externalChangeUpdatesValue() async {
    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("externalChange")) var count = 0

    // The in-memory store posts didChangeExternallyNotification for direct writes itself.
    store.set(7, forKey: "externalChange")
    await MainActor.run {}
    #expect(count == 7)
  }

  @Test
  func externalChangeToOtherKeyIsIgnored() async {
    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("ignoredKey")) var count = 0

    store.set(7, forKey: "someOtherKey")
    await MainActor.run {}
    #expect(count == 0)
  }

  @Test
  func quotaViolationSurfacesTypedError() {
    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("quota")) var count = 0

    withKnownIssue {
      NotificationCenter.default.post(
        name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
        object: store,
        userInfo: [
          NSUbiquitousKeyValueStoreChangeReasonKey: NSUbiquitousKeyValueStoreQuotaViolationChange
        ]
      )
    }
    #expect($count.loadError is iCloudKVQuotaError)
  }

  @Test
  func longKeyReportsIssue() {
    withKnownIssue {
      @Shared(.iCloudKV(String(repeating: "k", count: 65))) var count = 0
      _ = count
    }
  }

  @Test
  func warningsCanBeDisabled() {
    withDependencies {
      $0.iCloudKVWarningsEnabled = false
    } operation: {
      @Shared(.iCloudKV(String(repeating: "k", count: 65))) var count = 0
      _ = count
    }
  }

  @Test
  func requireThrowsWhenStoreIsEmpty() async {
    await #expect(throws: (any Error).self) {
      let _: SharedReader<Int> = try await SharedReader(require: .iCloudKV("requireMissing"))
    }
  }

  @Test
  func requireLoadsExistingValue() async throws {
    @Dependency(\.defaultiCloudKVStore) var store
    store.set(9, forKey: "requireExisting")
    let reader: SharedReader<Int> = try await SharedReader(require: .iCloudKV("requireExisting"))
    #expect(reader.wrappedValue == 9)
  }

  @Test
  func codableRoundtrip() throws {
    struct Settings: Codable, Equatable, Sendable {
      var name = "default"
      var size = 1
    }

    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("codable")) var settings = Settings()
    $settings.withLock { $0 = Settings(name: "custom", size: 99) }

    let data = try #require(store.data(forKey: "codable"))
    let decoded = try JSONDecoder().decode(Settings.self, from: data)
    #expect(decoded == Settings(name: "custom", size: 99))
  }

  @Test
  func rawRepresentableStoredAsRawValue() {
    enum Theme: String, Sendable {
      case light, dark
    }

    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("theme")) var theme = Theme.light
    $theme.withLock { $0 = .dark }
    #expect(store.string(forKey: "theme") == "dark")
  }

  @Test
  func urlStoredAsAbsoluteString() {
    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("url")) var link: URL?
    $link.withLock { $0 = URL(string: "https://example.com") }
    #expect(store.string(forKey: "url") == "https://example.com")
  }

  @Test
  func settingOptionalToNilRemovesValue() {
    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("optionalRemoval")) var value: Int?
    $value.withLock { $0 = 5 }
    #expect(store.object(forKey: "optionalRemoval") as? Int == 5)
    $value.withLock { $0 = nil }
    #expect(store.object(forKey: "optionalRemoval") == nil)
  }

  @Test
  func stringArrayRoundtrip() {
    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("tags")) var tags: [String] = []
    $tags.withLock { $0 = ["a", "b"] }
    #expect(store.object(forKey: "tags") as? [String] == ["a", "b"])
  }

  @Test
  func idIncludesStoreIdentity() {
    let store1 = NSUbiquitousKeyValueStore.inMemory
    let store2 = NSUbiquitousKeyValueStore.inMemory
    let key1: iCloudKVKey<Bool> = .iCloudKV("flag", store: store1)
    let key2: iCloudKVKey<Bool> = .iCloudKV("flag", store: store2)
    let key3: iCloudKVKey<Bool> = .iCloudKV("flag", store: store1)
    #expect(key1.id != key2.id)
    #expect(key1.id == key3.id)
  }

  @Test
  func inMemoryStoresAreIsolated() {
    let store1 = NSUbiquitousKeyValueStore.inMemory
    let store2 = NSUbiquitousKeyValueStore.inMemory
    store1.set("a" as Any?, forKey: "shared")
    #expect(store1.string(forKey: "shared") == "a")
    #expect(store2.object(forKey: "shared") == nil)
  }

  @Test
  func typeSafeDefaultKey() {
    @Shared(.isTestFlagOn) var isTestFlagOn
    #expect(isTestFlagOn == true)
  }

  @Test
  func optionalCodableRoundtrip() throws {
    struct Settings: Codable, Equatable, Sendable {
      var name = "default"
    }

    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("optionalCodable")) var settings: Settings?
    $settings.withLock { $0 = Settings(name: "custom") }
    #expect(settings == Settings(name: "custom"))

    let data = try #require(store.data(forKey: "optionalCodable"))
    #expect(try JSONDecoder().decode(Settings.self, from: data) == Settings(name: "custom"))
  }

  @Test
  func settingOptionalCodableToNilRemovesValue() {
    struct Settings: Codable, Equatable, Sendable {
      var name = "default"
    }

    @Dependency(\.defaultiCloudKVStore) var store
    @Shared(.iCloudKV("optionalCodableRemoval")) var settings: Settings?
    $settings.withLock { $0 = Settings(name: "custom") }
    #expect(store.data(forKey: "optionalCodableRemoval") != nil)
    $settings.withLock { $0 = nil }
    #expect(store.object(forKey: "optionalCodableRemoval") == nil)
  }

  @Test
  func corruptCodableDataFallsBackToDefault() {
    struct Settings: Codable, Equatable, Sendable {
      var name = "default"
    }

    @Dependency(\.defaultiCloudKVStore) var store
    store.set(Data("not json".utf8), forKey: "corruptCodable")
    @Shared(.iCloudKV("corruptCodable")) var settings = Settings()
    #expect(settings == Settings())
  }

  @Test
  func requireThrowsOnCorruptCodableData() async {
    struct Settings: Codable, Equatable, Sendable {
      var name = "default"
    }

    @Dependency(\.defaultiCloudKVStore) var store
    store.set(Data("not json".utf8), forKey: "requireCorrupt")
    await #expect(throws: (any Error).self) {
      let _: SharedReader<Settings> = try await SharedReader(require: .iCloudKV("requireCorrupt"))
    }
  }

  @Test
  func quotaErrorClearsAfterSuccessfulChange() async {
    let store = NSUbiquitousKeyValueStore.inMemory
    @Shared(.iCloudKV("quotaClears", store: store)) var count = 0

    withKnownIssue {
      NotificationCenter.default.post(
        name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
        object: store,
        userInfo: [
          NSUbiquitousKeyValueStoreChangeReasonKey: NSUbiquitousKeyValueStoreQuotaViolationChange
        ]
      )
    }
    #expect($count.loadError is iCloudKVQuotaError)

    store.set(3, forKey: "quotaClears")
    await MainActor.run {}
    #expect(count == 3)
    #expect($count.loadError == nil)
  }
}
