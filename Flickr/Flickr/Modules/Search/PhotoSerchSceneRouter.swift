//
//  PhotoSerchSceneRouter.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import Foundation

protocol PhotoSearchSceneRoutingLogic: AnyObject {
    typealias Controller = PhotoSearchSceneDisplayView & PhotoSearchViewController
    
    func routeToSearchHistory()
}

class PhotoSearchSceneRouter: PhotoSearchSceneRoutingLogic {
    
    // MARK: Stored Properties
    var viewController: Controller?

    // MARK: Initializers
    required init(controller: Controller?) {
        viewController = controller
    }
}

extension PhotoSearchSceneRouter {
    
    func routeToSearchHistory() {
        let searchHistoryViewController = SearchHistorySceneConfigurator.configure()
        searchHistoryViewController.delegate = viewController
        viewController?.navigationController?.pushViewController(searchHistoryViewController, animated: false)
    }
}
