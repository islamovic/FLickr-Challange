//
//  Request.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Alamofire

struct Request<Output> {
    let url: URL
    let method: HTTPMethod
    let params: Paramaters?
    var headers: Headers?
    let parse: (Data?) -> Output?
    
    init(url: URL,
         method: HTTPMethod = .get,
         params: Paramaters? = nil,
         headers: Headers? = nil,
         parse: @escaping(Data?) -> Output?) {
        self.url = url
        self.method = method
        self.params = params
        self.headers = headers
        self.parse = parse
    }
}

extension Request: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        
        if method == .get {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
            return urlRequest
        }
        urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        return urlRequest
    }
}
