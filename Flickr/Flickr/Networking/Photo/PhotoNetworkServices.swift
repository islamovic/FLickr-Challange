//
//  PhotoNetworkService.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

public class PhotoNetworkServices: NetworkService, PhotoUseCases {
    typealias PhotoError = NetworkError
    
    func search(
        _ input: Photo.Search.Input,
        completion: @escaping (Result<Photo.Search.Output, NetworkError>) -> Void) {
            
            let request = SearchRouter.fetchPhotoList(input)
            client.request(request, completion: completion)
    }
}
