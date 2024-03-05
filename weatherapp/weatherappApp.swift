import SwiftUI
import NavigationStack

@main
struct weatherappApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStackView {
                WeatherListView(viewModel: WeatherListViewModel())
            }
        }
    }
}
