//
//  CNJokes.swift
//  CNCodeChallengeApp_
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

class CNJokes: NSObject {
    
    var cnserviceManager = CNServiceManager()
    let totalNumberOfJokes =  602
    var currentPart  = 50
    
    var jokes:[CNJoke]?
    
    override init() {
        super.init()
        
        if jokes == nil {
            jokes = [CNJoke]()
        }
    }
    
    func loadTextJoke(urlString:String?,
                      success:@escaping (Void) -> Void,
                      failure:@escaping (NSError) -> Void) -> Void {
        
        cnserviceManager.fetchJokes(urlString: urlString,
                                    
                                    success: { (receivedData) in
                                        if let array = try? JSONSerialization.jsonObject(with: receivedData, options:  JSONSerialization.ReadingOptions.allowFragments){
                                            print(array)
                                            if ((((array as! NSDictionary).object (forKey : "value") as! NSDictionary).object(forKey : "joke") as? String) != nil) {
                                                self.jokes?.insert(CNJoke((array as! NSDictionary).object (forKey : "value") as? [String:AnyObject])!, at: 0)
                                                success()
                                            }
                                        } else {
                                            failure(NSError(domain: "CNCodeChallengeApp.CNJokes", code:200, userInfo: nil))
                                            return
                                        }
                                        
                                        
                                        
        },
                                    failure: { (error) in
                                        failure(error)
        })
        
    }
    
    
    
    func load(urlString:String?,
              success:@escaping (Void) -> Void,
              failure:@escaping (NSError) -> Void) -> Void {
        cnserviceManager.fetchJokes(urlString: urlString,
                                    
                                    success: { (receivedData) in
                                        if let array = try? JSONSerialization.jsonObject(with: receivedData, options:  JSONSerialization.ReadingOptions.allowFragments){
                                            
                                            if let __jokes = ((array as! NSDictionary).object (forKey : "value") as? NSArray) {
                                                
                                                
                                                for iitem in __jokes{
                                                    _ =  iitem as? [String:AnyObject]
                                                    //  _ = Mirror(reflecting: fr)
                                                    
                                                    guard iitem is NSDictionary else {
                                                        continue
                                                    }
                                                    self.jokes?.append(CNJoke(iitem as? [String:AnyObject])!)
                                                    
                                                }
                                                
                                                success()
                                            }
                                            
                                        } else {
                                            
                                            failure(NSError(domain: "CNCodeChallengeApp.CNJokes", code:200, userInfo: nil))
                                            return
                                        }
                                        
                                        
                                        
        },
                                    failure: { (error) in
                                        failure(error)
        })
        
    }
    
}
