//
//  CNTextInputJokesTableViewViewModel.swift
//  CNCodeChallengeApp_
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//


import Foundation

class CNTextInputJokesTableViewViewModel: NSObject {
    
    var cnjokes:CNJokes?
    var view:CNNeverEndingJokesTextInputProtocol?
    
    init(view:CNNeverEndingJokesTextInputProtocol, title:String , jokes:
        CNJokes? = nil) {
        super.init()
        print("view is not nil \(view)")
        self.view = view
        self.cnjokes = jokes ?? CNJokes()
        setNavigationTitle(title)
    }
    
    func initialViewSetup(){
        
    }
    
    
    func setNavigationTitle(_ title:String){
        guard !title.isEmpty else  {
         return
        
        }
        
        self.view?.setNavigationTitle(title)
    }
    
    func searchForJokes(_ enteredtext: String? ) {
        
        guard let _ = enteredtext  else  { return }
        
        
        let nameFormatter = PersonNameComponentsFormatter()
        let name =  enteredtext!
        // personNameComponents requires iOS (10.0 and later)
        let nameComps  = nameFormatter.personNameComponents(from: name)
        
        let firstName  = nameComps?.givenName
        
        let lastName = nameComps?.familyName
        
        
        guard let _ = firstName, let _ =  lastName else  {
            
            self.view?.showAlert("First Name and surname not set, please Enter name and surname in two seperate text.")
            return
        }
        
        let  str = "\(CNConstants.CNAPIUrls.baseURl)/&firstName=\(firstName!)&lastName=\(lastName!)"
        
        self.cnjokes?.loadTextJoke(urlString:  str   ,
                                   success : { () in
                                    DispatchQueue.main.async {
                                        self.view?.reloadTableView()
                                        print("Search for jokes reload table view called here ")
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



