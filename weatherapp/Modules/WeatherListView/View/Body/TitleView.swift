import SwiftUI
import WeatherCore

struct TitleView: View {
    var body: some View {
        ZStack {
            HStack {
                Text("Weather")
                    .font(.title)
                    .bold()
                    .foregroundColor(.textColor)
                Spacer()
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
