//
//  String+Extention.swift
//  weatherapp
//
//  Created by Lahiru Munasinghe on 2024-02-28.
//

import Foundation

extension String: Error, LocalizedError {
    public var errorDescription: String? { self }
}
