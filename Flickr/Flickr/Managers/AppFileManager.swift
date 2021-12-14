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
    
    static func save(search: String) {
        
        let path = historyFilePath()
        if !(fileManager.fileExists(atPath: path)) {
            createHistoryFile()
        } else {
            guard var history = fetchHistory() else { return }
            history.append(search)
            let dataToBeSaved = NSArray(array: history)
            dataToBeSaved.write(toFile: path, atomically: true)
        }
    }
    
    static func fetchHistory() -> [String]? {
        let path = historyFilePath()
        return NSArray(contentsOfFile: path) as? [String]
    }
}
