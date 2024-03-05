//
//  ServiceEnviroment.swift
//  Core
//
//  Created by Lahiru Munasinghe on 2024-03-05.
//
import Foundation

public struct ServiceEnviroment {
    
    var baseURL: String
    
    init(baseURL: String = "") {
        self.baseURL = baseURL
    }
    
    func pathURL(endpoint: String) -> String {
        return "\(baseURL)\(endpoint)"
    }
}
