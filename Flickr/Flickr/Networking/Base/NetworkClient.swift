//
//  NetworkClient.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

protocol NetworkClient {
    func request<V>(_ request: Request<V>, completion: @escaping(Result<V, NetworkError>) -> Void)
}
