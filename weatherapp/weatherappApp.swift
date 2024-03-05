import SwiftUI
import NavigationStack

@main
// swiftlint:disable:next type_name
struct weatherappApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStackView {
                WeatherListView(viewModel: WeatherListViewModel())
            }
        }
    }
}
