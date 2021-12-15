//
//  PhotoSearchScenePresentationLogicSpy.swift
//  FlickrTests
//
//  Created by Islam Ibrahim on 15/12/2021.
//

@testable import Flickr
import Foundation

class PhotoSearchScenePresentationLogicSpy: PhotoSearchScenePresentationLogic {
    
    var photosModel: Photo.Search.Output?
    var message: String?
    
    func presentPhotoSearch(_ photos: Photo.Search.Output) {
        self.photosModel = photos
    }
}
