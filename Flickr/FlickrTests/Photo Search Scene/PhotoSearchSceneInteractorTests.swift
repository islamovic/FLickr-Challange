//
//  PhotoSearchSceneInteractorTests.swift
//  FlickrTests
//
//  Created by Islam Ibrahim on 15/12/2021.
//

@testable import Flickr
import XCTest

class PhotoSearchSceneInteractorTests: XCTestCase {
    
    var sutInteractor: PhotoSearchSceneInteractor!
    var presenter: PhotoSearchScenePresentationLogicSpy!
    var photoSearchWorker: PhotoSearchSceneWorkerMock!
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        
        presenter = PhotoSearchScenePresentationLogicSpy()
        photoSearchWorker = PhotoSearchSceneWorkerMock(state: .success(PhotoStubs.getPhotosModel()))
        sutInteractor = PhotoSearchSceneInteractor(presenter: presenter)
    }
    
    override func tearDownWithError() throws {
        presenter = nil
        sutInteractor = nil
        
        try? super.tearDownWithError()
    }
    
    func testFetchPhotosListAndPassToPresenter() {
        
        // Given
        let photosModel = PhotoStubs.getPhotosModel()
        let photoSearchWorker = PhotoSearchSceneWorkerMock(state: .success(photosModel))
        sutInteractor = PhotoSearchSceneInteractor(presenter: presenter)
        sutInteractor.search = "Cat"
        sutInteractor.page = 1
        sutInteractor.perPage = 20
        
        // When
        sutInteractor.searchPhotos()
        photoSearchWorker.responseRecived()
        
        // Then
        let value = presenter.photosModel?.photos.isEmpty ?? false
        XCTAssertTrue(value)
    }
}
