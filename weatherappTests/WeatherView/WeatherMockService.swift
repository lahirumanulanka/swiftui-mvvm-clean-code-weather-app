import Foundation
import XCTest
@testable import weatherapp

class WeatherMockService: WeatherListViewModelProtocol {
    
    var manager: WeatherListDataManagerProtocol?
    var isSucess: Bool = false
    let expectationTest = XCTestExpectation(description: "Weather API")
    
    init(manager: WeatherListDataManagerProtocol = WeatherListDataManager()) {
        self.manager = manager
    }
    
    func fetchWeatherData(dataParams: DataParams) async {
        do {
            let _ = try await manager?.fetchWeatherData(dataParams)
            isSucess = true
            expectationTest.fulfill()
        } catch {
            isSucess = false
        }
    }
}


