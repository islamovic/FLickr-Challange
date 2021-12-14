//
//  SearchHistorySceneInteractor.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import Foundation

protocol SearchHistorySceneDataStore: AnyObject {
    var searchHistory: [String] { get set }
}

protocol SearchHistorySceneBusinessLogic: AnyObject {
    func fetchSearchHistory()
}

class SearchHistorySceneInteractor: SearchHistorySceneBusinessLogic, SearchHistorySceneDataStore {

    // MARK: - Stored Properties
    let presenter: SearchHistoryScenePresentationLogic?
    
    var searchHistory: [String] = []
    
    // MARK: - Initializers
    required init(presenter: SearchHistoryScenePresentationLogic) {
        self.presenter = presenter
    }
}

extension SearchHistorySceneInteractor {
    
    func fetchSearchHistory() {
        let searchHistory = AppFileManager.fetchHistory() ?? []
        self.searchHistory = searchHistory
        self.presenter?.presentSearchHistory(searchHistory)
    }
}
