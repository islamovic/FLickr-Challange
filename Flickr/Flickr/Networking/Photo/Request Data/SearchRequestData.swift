//
//  SearchRequestData.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

extension Photo.Search.Input: InputWrapping {
    
    func wrapping() -> [String : Any] {
        return [
            "tags": title,
            "api_key": Constants.Client.apiKey,
            "format": "json",
            "nojsoncallback": 1
        ]
    }
}
