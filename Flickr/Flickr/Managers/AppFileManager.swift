//
//  AppFileManager.swift
//  Flickr
//
//  Created by Islam Ibrahim on 14/12/2021.
//

import Foundation

struct AppFileManager {
    
    private static let fileManager = FileManager.default
    
    private static func historyFilePath() -> String {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true).first
        guard let documentDirectory = documentDirectory else { return "" }
        let path = documentDirectory.appending("/Search History.plist")
        return path
    }
    
    static func createHistoryFile() {
        
        let path = historyFilePath()
        let initData = NSArray(array: [])
        initData.write(toFile: path, atomically: true)
    }
    
    private static func save(histories: [String]) {

        var allHistory = histories
        allHistory.reverse()
        allHistory.forEach { history in
            AppFileManager.save(search: history)
        }
    }
    
    static func save(search: String) {
        
        let path = historyFilePath()
        if !(fileManager.fileExists(atPath: path)) {
            createHistoryFile()
        } else {
            guard var history = fetchHistory() else { return }
            if !historyExist(history, history: search) {
                history.insert(search, at: 0)
                let dataToBeSaved = NSArray(array: history)
                dataToBeSaved.write(toFile: path, atomically: true)
            }
        }
    }
    
    static func fetchHistory() -> [String]? {
        let path = historyFilePath()
        return NSArray(contentsOfFile: path) as? [String]
    }
    
    static func historyExist(_ historyList: [String], history: String) -> Bool {
        let selectedSearch = historyList.filter { $0 == history }
        return !selectedSearch.isEmpty
    }
    
    static func deleteHistory(_ history: String) {
        let searchHistory = fetchHistory() ?? []
        AppFileManager.deleteAllHistories()
        let updatedHistory = searchHistory.filter { $0 != history }
        AppFileManager.save(histories: updatedHistory)
    }
    
    static func deleteAllHistories() {
        createHistoryFile()
    }
}
