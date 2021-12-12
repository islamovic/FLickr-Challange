//
//  PhotoSearchScenePresenter.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

protocol PhotoSearchScenePresentationLogic: AnyObject {
    
}

class PhotoSearchScenePresenter: PhotoSearchScenePresentationLogic {
    
    // MARK: - Stored Properties
    weak var displayView: PhotoSearchSceneDisplayView?
    
    // MARK: - Initializers
    required init(displayView: PhotoSearchSceneDisplayView) {
        self.displayView = displayView
    }
}
