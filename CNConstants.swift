//
//  CNConstants.swift
//  CNCodeChallengeApp_
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

public typealias Title   = String
public typealias Joke  = String
public typealias ID   = uint
public typealias DicType = [String: AnyObject]

public struct CNConstants
{
    
    public struct CNAPIKey
    {
        static let titleKey  = "detail"
        static let jokeKey   = "joke"
        static let idKey     = "id"
    }
    
    public struct CNAPIUrls {
        
        static let randomBaseurl = "http://api.icndb.com/jokes/random/50/?escape=javascript"
        static let randomURl = "http://api.icndb.com/jokes/random/?escape=javascript"
        static let baseURl = "http://api.icndb.com/jokes/random/?escape=javascript"
        
        
        
    }
    
}
