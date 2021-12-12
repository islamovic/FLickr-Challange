//
//  NetworkService.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Alamofire

public class NetworkService: NSObject {
    
    let client: NetworkClient

    init(client: NetworkClient) {
        self.client = client
    }

    public static let sharedManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        let manager = Session(configuration: configuration)
        return manager
    }()

    public override init() {
        client = NetworkService.sharedManager
        super.init()
    }
}
