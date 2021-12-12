//
//  Environment.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

public enum Environment: String {
    case
        debug,
        release
    
    public static var current: Environment? {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            return nil
        }
        
        guard let environment = infoDictionary["Configuration"] as? String else {
            return nil
        }
        
        return Environment(rawValue: environment.lowercased())
    }
}
