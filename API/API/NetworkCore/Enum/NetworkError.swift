//
//  APIError.swift
//  Core
//
//  Created by Lahiru Munasinghe on 2024-03-05.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case badURL
    case noToken
    case tokenExpire
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case errorRespone(errorMsg: String)
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .tokenExpire:
            return "Token Expire"
        case .badURL, .parsing, .noToken, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(_):
            return "Sorry, the connection to our server failed."
        case .url(let error):
            return error?.localizedDescription ?? "Something wend wrong"
        case .errorRespone(_):
            return "Sorry, the connection to our server failed."
        }
        
        
    }
    
    var description: String {
        switch self {
        case .tokenExpire: return "Token Expire"
        case .unknown: return "unknown error"
        case .badURL: return "invalid URL"
        case .noToken: return "no access token"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .errorRespone(errorMsg: let errorMsg):
            return "\(errorMsg)"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)"
        }
    }
}
