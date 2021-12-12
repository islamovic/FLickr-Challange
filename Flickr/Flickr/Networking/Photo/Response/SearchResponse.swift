//
//  SearchResponse.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

struct Output: Codable {
    let photos: Photos
    let stat: String
}

struct Photos: Codable {
    
    var page: Int
    var pages: Int
    var perPage: Int
    var total: Int
    var list: [Photo]
    
    enum CodingKeys: String, CodingKey {
        
        case perPage = "perpage"
        case page
        case pages
        case total
        case list = "photo"
    }
}

extension Photo.Search.Output: OutputWrapping {
    
    init(resposneData: Data?) throws {
        
        guard let data = resposneData else { throw NetworkError.InvalidData }
        do {
            let response = try JSONDecoder().decode(Output.self, from: data)
            self.photos = response.photos.list
        } catch {
            throw NetworkError.CannotParseResponse
        }
    }
}
