import Foundation
import Model

enum WeatherAPI: RequestProtocol {
    case getWeather(_ dataParams: DataParams)
}

extension WeatherAPI {
    
    var environment: Enviroment {
        return NetworkManager.environment
    }
    
    var baseURL: ServiceEnviroment {
        return ServiceEnviroment(baseURL: environment.baseURL)
    }
    
    var endpoint: String {
        switch self {
        case .getWeather:
            return "/data/2.5/find"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getWeather:
            return .GET
        }
    }
    var parameters: [String : Any] {
        switch self {
        case .getWeather:
            return .init()
        }
    }
    
    var formBody: Data {
        switch self {
        case .getWeather:
            return .init()
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getWeather(let dataParams):
            return [
                URLQueryItem(name: "lat",
                             value: "\(dataParams.lat)"),
                URLQueryItem(name: "lon",
                             value: "\(dataParams.lon)"),
                URLQueryItem(name: "cnt",
                             value: "\(dataParams.cnt)"),
                URLQueryItem(name: "appid",
                             value: "\(dataParams.appid)"),
                URLQueryItem(name: "units",
                             value: "\(dataParams.units)"),
            ]
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .getWeather:
            return ["Content-Type" : "application/json; charset=utf-8"]
        }
    }
}




