//
//  PhotoSearchSceneInteractor.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

protocol PhotoSearchSceneDataStore: AnyObject {
    var photos: [Photo] { get set }
    
    var page: Int { get set }
    
    var perPage: Int { get set }
    
    var search: String { get set }
}

protocol PhotoSearchSceneBusinessLogic: AnyObject {
    func searchPhotos()
    
    func startFreshSearch()
}

class PhotoSearchSceneInteractor: PhotoSearchSceneBusinessLogic, PhotoSearchSceneDataStore {
    
    // MARK: - Stored Properties
    let presenter: PhotoSearchScenePresentationLogic?
    
    private let searchWorker = PhotoSearchWorker()
    
    var photos: [Photo] = []
    
    var search: String = ""
    
    var page: Int = 1
    
    var perPage: Int = 20
    
    // MARK: - Initializers
    required init(presenter: PhotoSearchScenePresentationLogic) {
        self.presenter = presenter
    }
}

extension PhotoSearchSceneInteractor {
    
    func searchPhotos() {
        searchWorker.search(search, page: page, perPage: perPage) { [weak self] result in
            
            switch result {
            case .success(let output):
                self?.presenter?.presentPhotoSearch(output)
                
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func startFreshSearch() {
        self.photos.removeAll()
        self.page = 1
    }
}
