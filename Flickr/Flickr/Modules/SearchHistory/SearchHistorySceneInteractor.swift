//
//  SearchHistorySceneInteractor.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import Foundation

protocol SearchHistorySceneDataStore: AnyObject {
    
    var searchHistory: [String] { get set }
    
    var search: String { get set }
}

protocol SearchHistorySceneBusinessLogic: AnyObject {
    func fetchSearchHistory()
    func saveHistory(search: String)
    func delete(history: String)
    func clearAllSearchHistory()
}

class SearchHistorySceneInteractor: SearchHistorySceneBusinessLogic, SearchHistorySceneDataStore {

    // MARK: - Stored Properties
    let presenter: SearchHistoryScenePresentationLogic?
    
    var searchHistory: [String] = []
    
    var search: String = ""
    
    private let fileManager = FileManager.default
    
    // MARK: - Initializers
    required init(presenter: SearchHistoryScenePresentationLogic) {
        self.presenter = presenter
    }
}

extension SearchHistorySceneInteractor {
    
    func fetchSearchHistory() {
        if let searchHistory = NSArray(contentsOfFile: path) as? [String] {
            self.searchHistory = searchHistory
            self.presenter?.presentSearchHistory(searchHistory)
        }
    }

    func saveHistory(search: String) {
        if !fileManager.fileExists(atPath: path) {
            self.createFreshFile()
        } else {
            if !isSearchExist {
                self.searchHistory.insert(search, at: 0)
                writeToFile(self.searchHistory)
            }
        }
    }
    
    func delete(history: String) {
        self.createFreshFile()
        self.searchHistory = self.searchHistory.filter { $0 != history }
        self.save(histories: self.searchHistory)
    }
    
    func clearAllSearchHistory() {
        self.createFreshFile()
        self.searchHistory = []
    }
}

private extension SearchHistorySceneInteractor {
    
    var isSearchExist: Bool {
        guard let allHistory = allSearchHistory else { return true }
        let selectedSearch = allHistory.filter { $0 == search }
        return !selectedSearch.isEmpty
    }
    
    var path: String {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true).first
        guard let documentDirectory = documentDirectory else { return "" }
        let path = documentDirectory.appending("/Search History.plist")
        return path
    }
    
    var allSearchHistory: [String]? {
        let searchHistory = NSArray(contentsOfFile: path) as? [String]
        return searchHistory
    }
    
    func writeToFile(_ searchHistory: [String]) {
        let dataToBeSaved = NSArray(array: searchHistory)
        dataToBeSaved.write(toFile: path, atomically: true)
    }
    
    func createFreshFile() {
        self.writeToFile([])
    }
    
    func save(histories: [String]) {
        var allHistory = self.searchHistory
        self.searchHistory = []
        allHistory.reverse()
        allHistory.forEach { history in
            self.saveHistory(search: history)
        }
    }
}
