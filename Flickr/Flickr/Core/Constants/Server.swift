//
//  Server.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

extension Constants {
    public enum Server {
        public static var baseURL: String? {
            guard let environment = Constants.ENV else {
                return nil
            }
            
            switch environment {
            case .release:
                return "https://www.flickr.com/services/rest/"
            case .debug:
                return "https://www.flickr.com/services/rest/"
            }
        }
    }
    
    public enum Client {
        public static let apiKey: String = "0dd5b843bc93f81f10cd532205bfe7cd"
    }
}
