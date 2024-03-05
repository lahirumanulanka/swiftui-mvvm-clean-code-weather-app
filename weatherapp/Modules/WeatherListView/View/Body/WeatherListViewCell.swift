import SwiftUI
import Model

struct WeatherListViewCell: View {
    @State var weatherData: Weather
    
    var body: some View {
        ZStack{
            Image("cell-bg")
                .resizable()
                .clipped()
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(weatherData.name)
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .bold()
                        Text(weatherData.sys.country)
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("\(Int(weatherData.main.temp))°")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                    }
                }
                Spacer()
                HStack{
                    Text(weatherData.weather.first?.weatherDescription ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                    Spacer()
                    HStack{
                        Text("H:\(Int(weatherData.main.tempMax))°")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                        Text("L:\(Int(weatherData.main.tempMin))°")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                    }
                    
                }
            }
            .padding()
        }
        .frame(height: 130)
        .cornerRadius(20)
    }
}
