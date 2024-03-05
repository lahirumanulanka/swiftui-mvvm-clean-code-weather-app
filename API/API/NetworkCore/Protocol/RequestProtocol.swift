//
//  RequestProtocol.swift
//  Core
//
//  Created by Lahiru Munasinghe on 2024-03-05.
//

import Foundation

public protocol RequestProtocol {
    var endpoint: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var formBody: Data { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem] { get }
}
