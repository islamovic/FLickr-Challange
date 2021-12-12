//
//  AppLibManager.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import UIKit

enum AppLibManager {
    static func setupLibraries(
        application: UIApplication,
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        setupNetworking()
    }
}

private extension AppLibManager {
    
    static func setupNetworking() {
        guard let baseURL = Constants.Server.baseURL else { return }
        NetworkingLayer.set(baseURI: baseURL)
    }
}
