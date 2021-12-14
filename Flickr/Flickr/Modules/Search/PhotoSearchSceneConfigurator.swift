//
//  PhotoSearchSceneConfigurator.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

class PhotoSearchSceneConfigurator {
    
    static func configure() -> PhotoSearchViewController {
        
        let viewController = PhotoSearchViewController()
        let presenter = PhotoSearchScenePresenter(displayView: viewController)
        let interactor = PhotoSearchSceneInteractor(presenter: presenter)
        let router = PhotoSearchSceneRouter(controller: viewController)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        viewController.router = router
        return viewController
    }
}
