//
//  RequestServiceProtocol.swift
//  Core
//
//  Created by Lahiru Munasinghe on 2024-03-05.
//

import Foundation

public protocol RequestServiceProtocol {
    func fetchData<T: Decodable>(request: RequestProtocol) async throws -> T
    func getURLRequest(urlString: String, _ request: RequestProtocol) -> URLRequest?
    func configRequestMethods(request: RequestProtocol, urlRequest: inout URLRequest)
    func urlSessionRequest<T: Decodable>(urlRequest: URLRequest) async throws -> T
}
