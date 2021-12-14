//
//  PhotoSearchScenePresenter.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

protocol PhotoSearchScenePresentationLogic: AnyObject {
    func presentPhotoSearch(_ photos: [Photo])
}

class PhotoSearchScenePresenter: PhotoSearchScenePresentationLogic {
    
    // MARK: - Stored Properties
    weak var displayView: PhotoSearchSceneDisplayView?
    
    // MARK: - Initializers
    required init(displayView: PhotoSearchSceneDisplayView) {
        self.displayView = displayView
    }
}

extension PhotoSearchScenePresenter {
    
    func presentPhotoSearch(_ photos: [Photo]) {
        self.displayView?.displaySearchResult(photos: photos)
    }
}
