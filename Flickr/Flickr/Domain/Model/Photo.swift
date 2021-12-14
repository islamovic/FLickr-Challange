//
//  Photo.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

struct Photo: Codable {
    
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let isPublic: Int
    let isFriend: Int
    let isFamily: Int
    
    init() {
        self.id = ""
        self.owner = ""
        self.secret = ""
        self.server = ""
        self.title = ""
        self.farm = 0
        self.isPublic = 0
        self.isFriend = 0
        self.isFamily = 0
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case owner
        case secret
        case server
        case farm
        case title
        case isPublic = "ispublic"
        case isFriend = "isfriend"
        case isFamily = "isfamily"
    }
}

extension Photo {
    var photoURL: String {
        return "http://farm\(self.farm).staticflickr.com/\(self.server)/\(self.id)_\(self.secret).png"
    }
}
