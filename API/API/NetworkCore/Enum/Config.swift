import Foundation

struct Config {
    
    struct API {
        enum TESTING {
            static let CLIENT = "ios"
            static let CLIENT_VERSION = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
            static let HOST = "https://api.openweathermap.org"
        }
    }
}

