//
//  PhotoSearchWorker.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

class PhotoSearchWorker {
    
    let photoSearchNetworkService = PhotoNetworkServices()
    
    func search(_ title: String, completion: @escaping (Result<Photo.Search.Output, NetworkError>) -> Void) {
        
        let input = Photo.Search.Input(title: title)
        photoSearchNetworkService.search(input) { result in
            
            var response: Result<Photo.Search.Output, NetworkError>
            defer { completion(response) }
            
            guard result.isSuccess else {
                response = .error(result.error!)
                return
            }
            response = .success(result.value!)
        }
    }
}
