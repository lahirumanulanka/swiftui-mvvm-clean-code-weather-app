//
//  RequestService.swift
//  Core
//
//  Created by Lahiru Munasinghe on 2024-03-05.
//

import Foundation
import UIKit
import Model
import WeatherCore

public struct RequestService: RequestServiceProtocol {

    public init() {}

    public func fetchData<T: Decodable>(request: RequestProtocol) async throws -> T {
        let baseURL = ProjectConfiguration.value(for: .BASE_URL)
        let urlString = "https://" + baseURL + request.endpoint
        guard var urlRequest = getURLRequest(urlString: urlString, request) else {
            fatalError("Failed to create URL for API call")
        }
        configRequestMethods(request: request, urlRequest: &urlRequest)
        return try await urlSessionRequest(urlRequest: urlRequest)
    }

    public func getURLRequest(urlString: String, _ request: RequestProtocol) -> URLRequest? {
        guard let url = URL(string: urlString), var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        if request.queryItems.count > 0 { urlComponent.queryItems = request.queryItems }
        return URLRequest(url: urlComponent.url!)
    }

    public func configRequestMethods(request: RequestProtocol, urlRequest: inout URLRequest) {
        switch request.httpMethod {
        case .POST, .PUT:
            request.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
            urlRequest.httpMethod = request.httpMethod.rawValue
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: request.parameters, options: [])
            if request.formBody.count > 0 {
                urlRequest.httpBody = request.formBody
            }
        case .GET, .PATCH, .DELETE:
            request.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
            urlRequest.httpMethod = request.httpMethod.rawValue
        }
    }

    public func urlSessionRequest<T: Decodable>(urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        debugPrint(response)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown
        }
        for (key, value) in httpResponse.allHeaderFields {
            debugPrint("\(key): \(value)")
        }
        if httpResponse.statusCode == 200 {
            return try JSONDecoder().decode(T.self, from: data)
        } else {
            do {
                let errorData = try JSONDecoder().decode(WeatherError.self, from: data)
                throw errorData
            } catch {
                throw NetworkError.badResponse(statusCode: httpResponse.statusCode)
            }
        }
    }
}
