import Foundation

public struct Response<T: Codable>: Codable {
    public let message: String
    public let cod:  String
    public let count: String
    public let data: T
}

public struct ResponseResult<T: Codable>: Codable {
    public let message: String
    public let cod:  String
    public let count: Int
    public let list: [T]
}

public struct WeatherError: Error, Decodable {
    public var cod : Bool
    public var message: String
}
