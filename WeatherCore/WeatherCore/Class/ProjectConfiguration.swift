//
//  ProjectConfiguration.swift
//  WeatherCore
//
//  Created by Lahiru Munasinghe on 2024-03-05.
//
import Model
import Foundation

public class ProjectConfiguration {
    public static func value(for key: ProjectConfigurationKey) -> String {
        if let object = Bundle.main.object(forInfoDictionaryKey: key.rawValue), let object = object as? String {
            return object
        } else {
            fatalError("Configuration \(key) not found")
        }
    }
}
