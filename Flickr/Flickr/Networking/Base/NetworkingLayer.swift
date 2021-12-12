//
//  NetworkingLayer.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

public class NetworkingLayer: NSObject {
    private var baseURI: String?
    
    private static let shared: NetworkingLayer = {
        return NetworkingLayer()
    }()
    
    public static var baseURI: String? {
        get {
            return shared.baseURI ?? nil
        }
        set {
            shared.baseURI = newValue
        }
    }
    
    public static func set(baseURI url: String) {
        self.baseURI = url
    }
}
