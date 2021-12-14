//
//  PhotoSearchSceneInteractor.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

protocol PhotoSearchSceneDataStore: AnyObject {
    var photos: [Photo] { get set }
}

protocol PhotoSearchSceneBusinessLogic: AnyObject {
    func search(_ title: String)
}

class PhotoSearchSceneInteractor: PhotoSearchSceneBusinessLogic, PhotoSearchSceneDataStore {
    
    // MARK: - Stored Properties
    let presenter: PhotoSearchScenePresentationLogic?
    
    private let searchWorker = PhotoSearchWorker()
    
    var photos: [Photo] = []
    
    // MARK: - Initializers
    required init(presenter: PhotoSearchScenePresentationLogic) {
        self.presenter = presenter
    }
}

extension PhotoSearchSceneInteractor {
    
    func search(_ title: String) {
        searchWorker.search(title) { [weak self] result in
            
            switch result {
            case .success(let output):
                self?.photos = output.photos
                self?.presenter?.presentPhotoSearch(output.photos)
                
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
}
