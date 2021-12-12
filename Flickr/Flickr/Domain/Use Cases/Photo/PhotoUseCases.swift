//
//  PhotoUseCases.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Foundation

protocol PhotoUseCases: AnyObject {
    associatedtype PhotoError: Error
    func search(
        _ input: Photo.Search.Input,
        completion: @escaping (Result<Photo.Search.Output, PhotoError>) -> Void)
}
