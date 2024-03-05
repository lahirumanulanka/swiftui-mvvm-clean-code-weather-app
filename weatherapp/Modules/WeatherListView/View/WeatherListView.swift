import SwiftUI
import NavigationStack
import Model
import WeatherCore

struct WeatherListView: View {
    @ObservedObject var viewModel: WeatherListViewModel
    @State var searchText: String = ""

    var body: some View {
        NavigationView {
            List(viewModel.weatherDataArray.filter {
                searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased())
            }, id: \.self) { weather in
                WeatherListViewCell(weatherData: weather)
            }
            .searchable(text: $searchText)
            .navigationBarTitle("Weather")
        }
        .alert(isPresented: .init(get: { viewModel.errorMessage != nil }, set: { _ in viewModel.errorMessage = nil}), error: "An error has accurd", actions: { _ in
        }, message: { _ in
            Text(viewModel.errorMessage ?? "")
        })
        .task {
            let dataParams = DataParams(lat: 37.785834, lon: -122.406417, cnt: 15, appid: "8e82b346a9b1ff743f400876b4dd32cd", units: "metric")
            await viewModel.fetchWeatherData(dataParams: dataParams)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherListView(viewModel: WeatherListViewModel())
                .preferredColorScheme(.dark)
            WeatherListView(viewModel: WeatherListViewModel())
                .preferredColorScheme(.light)
        }
    }
}
