//
//  SearchHistoryScenePresnter.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import Foundation

protocol SearchHistoryScenePresentationLogic: AnyObject {
    func presentSearchHistory(_ history: [String])
}

class SearchHistoryScenePresenter: SearchHistoryScenePresentationLogic {
    
    // MARK: - Stored Properties
    weak var displayView: SearchHistorySceneDisplayView?
    
    // MARK: - Initializers
    init(displayView: SearchHistorySceneDisplayView) {
        self.displayView = displayView
    }
}

extension SearchHistoryScenePresenter {
    func presentSearchHistory(_ history: [String]) {
        displayView?.displaySearchHistory(history)
    }
}
