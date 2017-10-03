//
//  CNServiceManager.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//



import Foundation

enum CNServiceResult {
    
    case Success
    case Failure
}


class CNServiceManager : NSObject {
    
    var session: CNURLSessionProtocol?
    private var dataTask: URLSessionDataTask?
    
    override init() {
        super.init()
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config )
    }
    
    /*
     func search(for item: String,  urlString:String?,  resultSize: String, success:@escaping (Data) -> Void,
     failure:@escaping (NSError) -> Void) -> Void {
     guard let session = session else {
     failure(NSError(domain: "CNServiceManager.search", code:100, userInfo: nil))
     
     return
     }
     
     guard let urlString = urlString,
     let url = URL(string: urlString) else {
     failure(NSError(domain: "CNServiceManager", code:101, userInfo: nil))
     return
     }
     
     
     dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
     
     if let error = error {
     failure(error as NSError)
     return
     }
     
     if let response = response as? HTTPURLResponse,
     let data = data {
     if response.statusCode == 200 {
     success(data)
     return
     }
     }
     
     failure(NSError(domain: "CNServiceManager", code:102, userInfo: nil))
     return
     })
     
     dataTask?.resume()
     }
     */
    
    func fetchJokes(urlString:String?,
                    success:@escaping (Data) -> Void,
                    failure:@escaping (NSError) -> Void) -> Void {
        
        guard let session = session else {
            failure(NSError(domain: "CNServiceManager", code:100, userInfo: nil))
            
            return
        }
        
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
                failure(NSError(domain: "CNServiceManager", code:101, userInfo: nil))
                return
        }
        
        dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
                failure(error as NSError)
                return
            }
            
            if let response = response as? HTTPURLResponse,
                let data = data {
                if response.statusCode == 200 {
                    success(data)
                    return
                }
            }
            
            failure(NSError(domain: "CNServiceManager", code:102, userInfo: nil))
            return
        })
        
        dataTask?.resume()
    }
    
}
