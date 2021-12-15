//
//  SearchHistoryScenePresentationLogicSpy.swift
//  FlickrTests
//
//  Created by Islam Ibrahim on 15/12/2021.
//

@testable import Flickr
import Foundation

class SearchHistoryScenePresentationLogicSpy: SearchHistoryScenePresentationLogic {
    
    var searchHistory: [String]?
    
    func presentSearchHistory(_ searchHistory: [String]) {
        self.searchHistory = searchHistory
    }
}
