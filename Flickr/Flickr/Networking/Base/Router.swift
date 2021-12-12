//
//  Router.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

protocol Router {
    static var rootURL: String? { get }
    static var name: String? { get }
    static var apiVersion: String? { get }
}

extension Router {
    static var apiVersion: String? {
        return nil
    }
    
    static var name: String? {
        return nil
    }
    
    static var rootURL: String? {
        return NetworkingLayer.baseURI ?? nil
    }
    
    static func generateURL(_ components: String...) -> URL {
        let urlString = URLStringGenerator.resource(name, root: rootURL ?? "", apiVersion: apiVersion)(components)
        return URL(string: urlString)!
    }
}
