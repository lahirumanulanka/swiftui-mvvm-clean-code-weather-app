import Foundation

// MARK: - Login
public struct DataParams {
    public let lat, lon: Double
    public let cnt: Int
    public let appid, units: String
    
    public init(lat: Double, lon: Double, cnt: Int, appid: String, units: String) {
        self.lat = lat
        self.lon = lon
        self.cnt = cnt
        self.appid = appid
        self.units = units
    }
}
