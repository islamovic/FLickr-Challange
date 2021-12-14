//
//  SearchHistorySceneConfigurator.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import Foundation

class SearchHistorySceneConfigurator {
    
    static func configure() -> SearchHistoryViewController {
        let viewController = SearchHistoryViewController()
        let presenter = SearchHistoryScenePresenter(displayView: viewController)
        let interactor = SearchHistorySceneInteractor(presenter: presenter)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        return viewController
    }
}
