//
//  PhotoSearchSceneInteractor.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

protocol PhotoSearchSceneBusinessLogic: AnyObject {
    
}

class PhotoSearchSceneInteractor: PhotoSearchSceneBusinessLogic {
    
    // MARK: - Stored Properties
    weak var presenter: PhotoSearchScenePresentationLogic?
    
    // MARK: - Initializers
    required init(presenter: PhotoSearchScenePresentationLogic) {
        self.presenter = presenter
    }
    
}
