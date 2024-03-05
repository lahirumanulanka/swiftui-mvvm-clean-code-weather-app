import Foundation
import Model

public protocol WeatherListDataManagerProtocol {
    var requestService: RequestServiceProtocol { get set }
    func fetchWeatherData(_ dataParams: DataParams) async throws -> ResponseResult<Weather>
}

public class WeatherListDataManager: WeatherListDataManagerProtocol {
    public var requestService: RequestServiceProtocol

    public init(_ requestService: RequestServiceProtocol = RequestService()) {
        self.requestService = requestService
    }

    public func fetchWeatherData(_ dataParams: DataParams) async throws -> ResponseResult<Weather> {
        do {
            let weatherData: ResponseResult<Weather> = try await requestService.fetchData(request: WeatherAPI.getWeather(dataParams))
            return weatherData
        } catch {
            throw error
        }
    }
}
