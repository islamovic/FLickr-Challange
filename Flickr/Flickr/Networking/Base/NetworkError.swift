//
//  NetworkError.swift
//  Flickr
//
//  Created by Islam Ibrahim on 12/12/2021.
//

import Alamofire

public enum NetworkError: Error, Equatable {
    case emptyResposne
    case UnableToDecode
    case CannotParseResponse
    case NoInternet
    case UnAuthorized
    case NotFound
    case InvalidData
    case AppNeedsToUpdate
    case Server(String, Int)
    case InvalidSMSCode
    case SMSRateExceeded
    case ParsingCode
    case InvalidURL
    case Unknown
    
    init(dataResponse resposne: AFDataResponse<Data>) {
        guard let serverResponse = resposne.response else {
            self = .Unknown
            return
        }
        
        let statusCode = serverResponse.statusCode
        guard let serverData = resposne.data else {
            let message = resposne.error?.localizedDescription ?? "Server error"
            self = .Server(message, statusCode)
            return
        }
        
        let json = (try? JSONSerialization.jsonObject(with: serverData, options: [])) as? JSON
        guard let serverErrorMessage = json?["message"] as? String else {
            self = .CannotParseResponse
            return
        }
        
        self = .Server(serverErrorMessage, statusCode)
    }
}

extension Int {
    
    var review: NetworkError {
        switch self {
        case 401:
            return .UnAuthorized
        case 404:
            return .NotFound
        case 403:
            return .InvalidData
        case 429:
            return .SMSRateExceeded
        case 442:
            return .AppNeedsToUpdate
        case 500:
            return .Server("Server Error", 500)
        case 555:
            return .ParsingCode
        case 1212:
            return .InvalidSMSCode
        case -1010:
            return .NoInternet
        default:
            return .Unknown
        }
    }
}

extension NetworkError: LocalizedError {
    public var localizedDescription: String {
        switch self {
        case .CannotParseResponse:
            return "Cannot Parse Response"
        default:
            return ""
        }
    }
}
