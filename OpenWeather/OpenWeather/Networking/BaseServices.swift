//
//  BaseServices.swift
//  OpenWeather
//
//  Created by Calin Drule on 10/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

typealias URLRequestClosure<T: Decodable> = (T?, Error?) -> Void

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

class BaseServices: NSObject {
    static let session = URLSession(configuration: URLSessionConfiguration.default)
    
    struct BaseServicesConstants {
        static let httpProtocol = "http://"
        static let httpsProtocol = "https://"
    }
    struct ServiceErrorDescriptions {
        static let BadURLFormat = "Bad URL format: %@"
        static let NoDataReceived = "No data in response"
        static let DeserializationError = "Unable to deserialize to type %@"
    }
    
    static func callService<T: Decodable>(from urlString: String, completion: @escaping URLRequestClosure<T>) -> Void {
        let lowercaseURL = urlString.lowercased()
        
        guard let url = URL(string: urlString), lowercaseURL.contains(BaseServicesConstants.httpProtocol) || lowercaseURL.contains(BaseServicesConstants.httpsProtocol) else {
            let errorMessage = String(format: ServiceErrorDescriptions.BadURLFormat, urlString)
            executeOnMainThread {
                completion(nil, BackendError.urlError(reason: errorMessage))
            }
            return
        }
        
        toggleNetworkActivityIndicator(on: true)
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                print("Failed to download from \(String(describing: response?.url)), reason \(String(describing: error?.localizedDescription))")
                executeOnMainThread {
                    completion(nil, error)
                }
                return
            }
            
            handleSuccessfulResponse(data: data, response: response, completion: completion)
        }
        
        dataTask.resume()
    }
    
    // MARK: - Private methods
    
    fileprivate static func handleSuccessfulResponse<T: Decodable>(data: Data?, response: URLResponse?, completion: @escaping URLRequestClosure<T>) {
        toggleNetworkActivityIndicator(on: false)
        
        guard let responseData = data else {
            executeOnMainThread {
                completion(nil, BackendError.objectSerialization(reason: ServiceErrorDescriptions.NoDataReceived))
            }
            return
        }
        
        parse(data: responseData, completion: completion)
    }
    
    fileprivate static func parse<T: Decodable>(data: Data, completion: @escaping URLRequestClosure<T>) {
        let decoder = JSONDecoder()
        
        do {
            let decodedModel = try decoder.decode(T.self, from: data)
            executeOnMainThread {
                completion(decodedModel, nil)
            }
        } catch {
            let typeString = "\(T.self)"
            executeOnMainThread {
                completion(nil, BackendError.objectSerialization(reason: String(format: ServiceErrorDescriptions.DeserializationError, typeString)))
            }
        }
    }
    
    fileprivate static func executeOnMainThread(closure: @escaping () -> Void) {
        DispatchQueue.main.async(execute: closure)
    }
    
    fileprivate static func toggleNetworkActivityIndicator(on: Bool) {
        executeOnMainThread {
            UIApplication.shared.isNetworkActivityIndicatorVisible = on
        }
    }
}
