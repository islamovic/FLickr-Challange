//
//  SearchRouter.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

enum SearchRouter: Router {
    static var name: String? = "?method=flickr.photos.search"
}

extension SearchRouter {
    
    static func fetchPhotoList(_ input: Photo.Search.Input) -> Request<Photo.Search.Output> {
        let url = generateURL("")
        let params = input.wrapping()
        return Request(url: url, method: .get, params: params, parse: { try? .init(resposneData: $0) })
    }
}
