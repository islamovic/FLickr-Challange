//
//  PhotoSearchSceneWorkerMock.swift
//  FlickrTests
//
//  Created by Islam Ibrahim on 15/12/2021.
//

@testable import Flickr
import Foundation

class PhotoSearchSceneWorkerMock: PhotoSearchWorker {

    enum PhotoSearchSceneWorkerMockState {
        case success(Photo.Search.Output)
        case failure(NetworkError)
    }
    
    private var mockState: PhotoSearchSceneWorkerMockState
    private var completion: ((Result<Photo.Search.Output, NetworkError>) -> Void)?
    
    var isFetchAPITriggered = false
    
    init(state: PhotoSearchSceneWorkerMockState) {
        self.mockState = state
    }
    
    func responseRecived() {
        switch self.mockState {
        case .success(let photos):
            self.completion?(.success(photos))
        case .failure(let error):
            self.completion?(.error(error))
        }
    }

    override func search(_ title: String, page: Int, perPage: Int,
                         completion: @escaping (Result<Photo.Search.Output, NetworkError>) -> Void) {
        self.isFetchAPITriggered = true
        self.completion = completion
    }
}
