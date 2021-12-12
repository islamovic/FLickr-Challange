//
//  SessionManager.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Alamofire

extension Session: NetworkClient {
    
    func request<V>(_ request: Request<V>, completion: @escaping (Result<V, NetworkError>) -> Void) {
        self.request(request).validate().responseData { response in
            
            var result: Result<V, NetworkError>
            defer { completion(result) }
            
            switch response.result {
            case .success(let value):
                guard let parsedResponse = request.parse(value) else {
                    result = .error(.CannotParseResponse)
                    return
                }
                
                result = .success(parsedResponse)
                
            case .failure:
                let networkError = NetworkError(dataResponse: response)
                result = .error(networkError)
            }
        }
    }
}
