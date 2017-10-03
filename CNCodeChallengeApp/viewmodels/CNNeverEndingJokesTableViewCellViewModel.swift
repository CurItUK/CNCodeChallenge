//
//  CNNeverEndingJokesTableViewCellViewModel.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

class CNNeverEndingJokesTableViewCellViewModel : NSObject {
    
    var model:CNJoke?
    var view :CNNeverEndingJokesTableViewCellProtocol?
    
    init?(model:CNJoke?) {
        guard let model = model else {
            return nil
        }
        self.model = model
        super.init()
    }
    
    func setup() {
        guard let _ = view ,
            let model = model,
            let title = model.title,
            let joke = model.joke,
            let id  = model.id  else {
                return
        }
        self.setDetail(joke)
        self.setID(String(id))
        self.setTitle(title)
    }
    
    
    func setID(_ id: String){
      
        view!.setID(String(id))
    }
    
    func setTitle(_ title:String){
        
        view!.setTitle(title)
    
    }
    
    func setDetail(_ detail:String){
        view!.setDetail(detail)
    
    }
    
}
