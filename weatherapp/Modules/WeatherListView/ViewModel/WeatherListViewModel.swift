import Foundation
import Model
import API

protocol WeatherListViewModelProtocol: AnyObject {
    var manager: WeatherListDataManagerProtocol? { get set }
    func fetchWeatherData(dataParams: DataParams) async
}

class WeatherListViewModel: NSObject, ObservableObject, WeatherListViewModelProtocol {
    var manager: WeatherListDataManagerProtocol?
    
    @Published var weatherDataArray: [Weather] = [Weather]()
    @Published var isLoginSuccess = false
    @Published var isAlertPresented: Bool = false
    @Published var errorMessage: String?
    internal var loadingState: LoadingStateProtocol = LoadingState()
    
    init(manager: WeatherListDataManagerProtocol = WeatherListDataManager(),
         loading: LoadingStateProtocol = LoadingState()) {
        super.init()
        self.manager = manager
        self.loadingState = loading
    }

    @MainActor
    func fetchWeatherData(dataParams: DataParams) async {
        self.isAlertPresented = false
        self.loadingState.isLoading = true
        do {
            let response = try await manager?.fetchWeatherData(dataParams)
            weatherDataArray = response?.list ?? []
            isLoginSuccess = true
            loadingState.isLoading = false
        } catch let error as WeatherError {
            errorMessage = error.message
            isAlertPresented = true
            loadingState.isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isAlertPresented = true
            loadingState.isLoading = false
        }
    }
}
