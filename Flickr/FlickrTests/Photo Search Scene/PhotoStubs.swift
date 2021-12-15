//
//  PhotoStubs.swift
//  FlickrTests
//
//  Created by Islam Ibrahim on 15/12/2021.
//

@testable import Flickr
import Foundation

struct PhotoStubs {
    
    static func getPhotosModel() -> Photo.Search.Output {
        let firstPhoto = Photo()
        let secondPhoto = Photo()
        let thirdPhoto = Photo()
        let forthPhoto = Photo()
        let fivthPhoto = Photo()
        let sixthPhoto = Photo()
        let seventhPhoto = Photo()
        
        return Photo.Search.Output(photos: [
            firstPhoto, secondPhoto, thirdPhoto, forthPhoto, fivthPhoto, sixthPhoto, seventhPhoto])
    }
}
