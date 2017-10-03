//
//  CNJoke.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

class CNJoke: NSObject{
    
    var joke:Joke?
    var title: Title?
    var id:ID?
    
    //TODO: Will be added after the service API, spaces and quotes must be cleaned
    // var jokeValidator: TitleValidator?
    // var detailValidator: DetailValidator?
    
    init?(_ dictionary: [String:AnyObject]?){
        guard let dictionary = dictionary,
            let joke = dictionary[CNConstants.CNAPIKey.jokeKey] as? Joke,
            let id = dictionary[CNConstants.CNAPIKey.idKey] as? ID  else  {
                return nil
        }
        super.init()
        self.joke = joke
        self.title =  "Joke"
        self.id = id
        
    }
    
    
}

