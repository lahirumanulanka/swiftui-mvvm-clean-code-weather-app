import Foundation

public enum Enviroment {
    
    case test
    
    public var baseURL: String {
        switch NetworkManager.environment {
        case .test:
            return Config.API.TESTING.HOST
        }
    }
    
    public var version: String {
        switch NetworkManager.environment {
        case .test:
            return Config.API.TESTING.CLIENT_VERSION
        }
    }

    public var client: String {
        switch NetworkManager.environment {
        case .test:
            return Config.API.TESTING.CLIENT
        }
    }
}

struct NetworkManager {
    static var environment: Enviroment = .test
}

