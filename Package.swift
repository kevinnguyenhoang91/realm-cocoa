// swift-tools-version:5.1

import PackageDescription
import Foundation

let versionStr = "5.20.0"
let versionPieces = versionStr.split(separator: ".")

let package = Package(
    name: "Realm",
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["Realm", "RealmSwift"]),
    ],
    dependencies: [
        .package(path: "/src/realm-core"),
    ],
    targets: [
      .target(
            name: "Realm",
            dependencies: ["RealmCore"],
            path: ".",
            exclude: [
                "Realm/NSError+RLMSync.m",
                "Realm/RLMNetworkClient.mm",
                "Realm/RLMRealm+Sync.mm",
                "Realm/RLMRealmConfiguration+Sync.mm",
                "Realm/RLMSyncConfiguration.mm",
                "Realm/RLMSyncCredentials.m",
                "Realm/RLMSyncManager.mm",
                "Realm/RLMSyncPermission.mm",
                "Realm/RLMSyncPermissionResults.mm",
                "Realm/RLMSyncSession.mm",
                "Realm/RLMSyncSessionRefreshHandle.mm",
                "Realm/RLMSyncSubscription.mm",
                "Realm/RLMSyncUser.mm",
                "Realm/RLMSyncUtil.mm",

                "Realm/ObjectServerTests",
                "Realm/Swift",
                "Realm/Tests",
                "Realm/ObjectStore/external",
                "Realm/ObjectStore/tests",
                "Realm/ObjectStore/src/server",
                "Realm/ObjectStore/src/sync",
                "Realm/ObjectStore/src/impl/generic",
                "Realm/ObjectStore/src/impl/epoll",
                "Realm/ObjectStore/src/impl/android",
                "Realm/ObjectStore/src/impl/windows",
            ],
            sources: ["Realm"],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("include"),
                .headerSearchPath("Realm/ObjectStore/src"),
                .define("REALM_COCOA_VERSION", to: "@\"3.16.1\""),
                .define("REALM_VERSION", to: "\"5.20.0\""),

                .define("REALM_NO_CONFIG"),
                .define("REALM_INSTALL_LIBEXECDIR", to: ""),
                .define("REALM_ENABLE_ASSERTIONS", to: "1"),
                .define("REALM_ENABLE_ENCRYPTION", to: "1"),

                .define("REALM_VERSION_MAJOR", to: String(versionPieces[0])),
                .define("REALM_VERSION_MINOR", to: String(versionPieces[1])),
                .define("REALM_VERSION_PATCH", to: String(versionPieces[2])),
                .define("REALM_VERSION_EXTRA", to: "\"\""),
                .define("REALM_VERSION_STRING", to: "\"\(versionStr)\""),
            ]
        ),
        .target(
            name: "RealmSwift",
            dependencies: ["Realm"],
            path: "RealmSwift",
            exclude: [
                "Tests",
            ]
        ),
    ],
    cxxLanguageStandard: .cxx14
)
