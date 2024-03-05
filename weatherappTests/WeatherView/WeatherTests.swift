import XCTest
@testable import weatherapp
import Combine

class WeatherTests: XCTestCase {
    private var cancellables: [AnyCancellable?] = []
    var mockUserService: WeatherMockService!

    override func setUp() {
        mockUserService = WeatherMockService()
    }

    func testWeatherDataSetsSuccessPresentedToTrue() async {
        let dataParams = DataParams(lat: 37.785834, lon: -122.406417, cnt: 15, appid: "8e82b346a9b1ff743f400876b4dd32cd", units: "metric")
        await mockUserService.fetchWeatherData(dataParams: dataParams)
        XCTAssertTrue(mockUserService.isSucess)
    }

}
