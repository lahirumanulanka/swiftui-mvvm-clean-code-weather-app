import Foundation

struct Config {

    struct API {
        // swiftlint:disable nesting
        enum TESTING {
            static let CLIENT = "ios"
            // swiftlint:disable:next identifier_name
            static let CLIENT_VERSION = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
            static let HOST = "https://api.openweathermap.org"
        }
    }
}
