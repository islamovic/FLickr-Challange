//
//  Search.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

extension Photo {
    enum Search { }
}

extension Photo.Search {
    
    struct Input {
        let title: String
        let page: Int
        let perPage: Int
    }
    
    struct Output {
        let photos: [Photo]
    }
}
