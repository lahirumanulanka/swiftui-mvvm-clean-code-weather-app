import SwiftUI
import MapKit
import NavigationStack

struct WeatherMapView: View {
    @ObservedObject var viewModel: WeatherListViewModel

    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7666, longitude: -122.4511),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    var body: some View {
        ZStack {
            Map(coordinateRegion: $coordinateRegion,
                annotationItems: viewModel.weatherDataArray) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    ZStack {
                        ZStack {
                            Image("location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text("\(Int(place.main.temp))º")
                                .font(.system(size: 8))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                                .padding(.bottom, 8)
                        }
                        Text(place.name)
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .padding(.top, 55)

                    }
                }
            }.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    PopView {
                        Image("list")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }

                }
                .padding(.top, 10)
                .padding(.trailing, 40)
                Spacer()
            }
        }
    }
}

struct WeatherMapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherMapView(viewModel: WeatherListViewModel())
                .preferredColorScheme(.dark)
            WeatherMapView(viewModel: WeatherListViewModel())
                .preferredColorScheme(.light)
        }
    }
}
