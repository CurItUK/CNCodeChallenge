//
//  CNNeverEndingJokesTableViewViewModel.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//


import Foundation

class CNNeverEndingJokesTableViewViewModel: NSObject {
    
    var cnjokes:CNJokes?
    var view:CNNeverEndingJokesTableViewControllerProtocol?
    
    
    init(view:CNNeverEndingJokesTableViewControllerProtocol, title:String , jokes:
        CNJokes? = nil) {
        super.init()
        self.view = view
        self.cnjokes = jokes ?? CNJokes()
        
    }
    
    func initialViewSetup(){
        // TODO: initialViewSetup to be added
         view?.setNavigationTitle("Never Ending Jokes")
    }
    func viewDidAppear() {
        //  super.viewWillAppear(animated)
       
        guard cnjokes != nil else  {
            return
        
        }
        self.getRandomJokes()
    }
    
    func getRandomJokes() {
        self.cnjokes?.load(urlString:  CNConstants.CNAPIUrls.randomBaseurl  ,
                           
                           success : { () in
                            DispatchQueue.main.async {
                                self.view?.reloadTableView()
                            }
        },
                           failure: { (error) in
                            print(error.description)
        })
    }
    
    func numberOfSections() -> Int {
        guard let jokeslist = cnjokes,
            let _ = jokeslist.jokes else {
                return 0
        }
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int {
        guard let jokeslist = cnjokes,
            let _jokes = jokeslist.jokes else {
                return 0
        }
        return _jokes.count
    }
    
    func cellViewModel(forIndexPath indexPath:IndexPath) -> CNNeverEndingJokesTableViewCellViewModel? {
        let row = indexPath.row
        
        guard let jokeslist = cnjokes,
            let _jokes = jokeslist.jokes else {
                return nil
        }
        
        if row < 0 || row >= _jokes.count {
            return nil
        }
        
        let jokeList = _jokes[row]
        return CNNeverEndingJokesTableViewCellViewModel(model:jokeList)
    }
}



