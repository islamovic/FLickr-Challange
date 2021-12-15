//
//  SearchHistorySceneInteractorTests.swift
//  FlickrTests
//
//  Created by Islam Ibrahim on 15/12/2021.
//

@testable import Flickr
import XCTest

class SearchHistorySceneInteractorTests: XCTestCase {
    
    var sutInteractor: SearchHistorySceneInteractor!
    var presenter: SearchHistoryScenePresentationLogicSpy!

    override func setUpWithError() throws {
        try? super.setUpWithError()
        
        presenter = SearchHistoryScenePresentationLogicSpy()
        sutInteractor = SearchHistorySceneInteractor(presenter: presenter)
    }

    override func tearDownWithError() throws {
        sutInteractor = nil
        presenter = nil
        
        try? super.tearDownWithError()
    }
    
    func testSaveHistory() {
        // Given
        sutInteractor = SearchHistorySceneInteractor(presenter: presenter)
        
        // When
        sutInteractor.saveHistory(search: "Cat")
        sutInteractor.saveHistory(search: "Sports")
        sutInteractor.saveHistory(search: "Cars")
        sutInteractor.saveHistory(search: "Apple")
        sutInteractor.saveHistory(search: "Lego")
        sutInteractor.fetchSearchHistory()
        
        // Then
        XCTAssertEqual(presenter.searchHistory?.first, "Lego")
    }
    
    func testDeleteHistory() {
        // Given
        sutInteractor = SearchHistorySceneInteractor(presenter: presenter)
        
        // When
        sutInteractor.saveHistory(search: "Cat")
        sutInteractor.saveHistory(search: "Sports")
        sutInteractor.saveHistory(search: "Cars")
        sutInteractor.saveHistory(search: "Apple")
        sutInteractor.saveHistory(search: "Lego")
        sutInteractor.delete(history: "Lego")
        sutInteractor.fetchSearchHistory()
        
        // Then
        XCTAssertEqual(presenter.searchHistory?.first, "Apple")
    }
    
    func testClearAllHistory() {
        // Given
        sutInteractor = SearchHistorySceneInteractor(presenter: presenter)
        
        // When
        sutInteractor.saveHistory(search: "Cat")
        sutInteractor.saveHistory(search: "Sports")
        sutInteractor.saveHistory(search: "Cars")
        sutInteractor.saveHistory(search: "Apple")
        sutInteractor.saveHistory(search: "Lego")
        sutInteractor.clearAllSearchHistory()
        sutInteractor.fetchSearchHistory()
        
        // Then
        XCTAssertEqual(presenter.searchHistory?.isEmpty ?? false, true)
    }

}
