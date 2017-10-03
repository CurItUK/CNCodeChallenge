//
//  CNMainJokesViewModel.swift
//  CNCodeChallengeApp_
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//
import Foundation

class  CNMainJokesViewModel: NSObject {
    
    weak var view:CNMainJokesViewControllerProtocol?
    var cnjokes:CNJokes?
    init(view:CNMainJokesViewControllerProtocol , jokes:
        CNJokes? = nil) {
        super.init()
        self.view = view
        self.cnjokes = jokes ?? CNJokes()
    }
    
    func initialViewSetup() {
        view?.enableRandomJokeButton(true)
        view?.enableTextInputJokeButton(true)
        view?.enableNeverEndingJokesButton(true)
    }
    
    
    func getRandomJoke() {
        self.cnjokes?.loadTextJoke(urlString:CNConstants.CNAPIUrls.randomURl,
                                   
                                   success : { () in
                                    DispatchQueue.main.async {
                                        print("success")
                                        self.view?.showAlert((self.cnjokes?.jokes?[0].joke)!)
                                        
                                    }
        },
                                   failure: { (error) in
                                    print(error.description)
        })
    }
    
    
    func showNeverEndingJokes(){
        view?.displayNeverEndingJokesScreen()
    }
    
}
