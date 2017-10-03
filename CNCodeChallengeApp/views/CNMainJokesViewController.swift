//
//  CNMainJokesViewController.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//


import Foundation
import UIKit

class CNMainJokesViewController: UIViewController {
    
    @IBOutlet weak var randomJokeButton: UIButton!
    @IBOutlet weak var textInputButton: UIButton!
    @IBOutlet weak var neverEndingJokesButton: UIButton!
    
    var viewModel: CNMainJokesViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.viewModel == nil {
            self.viewModel = CNMainJokesViewModel(view: self)
        }
        
        // TODO: refreshUI here :::: ??
        self.viewModel?.initialViewSetup()
    }
    
    
    // TODO: Fixing here !!!!!!!!!!
    @IBAction func getRandJoke(_ sender: Any) {
        
        let snx  = self.viewModel
        guard snx != nil else {
            return
        }
        
        self.viewModel?.getRandomJoke()   //showAlert( snx!)
    }
    
    func setup() {
        //  self.viewModel?.setup()
    }
    @IBAction func showNeverEndingJokes(_ sender: Any) {
        
        self.viewModel?.showNeverEndingJokes()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CNMainJokesViewController : CNMainJokesViewControllerProtocol {
    
    
    func enableRandomJokeButton(_ state:Bool) {
        self.randomJokeButton.isEnabled = state
    }
    
    func enableTextInputJokeButton(_ state:Bool) {
        self.textInputButton.isEnabled = state
    }
    
    func enableNeverEndingJokesButton(_ state:Bool) {
        self.neverEndingJokesButton.isEnabled = state
    }
    
    func displayNeverEndingJokesScreen() {
        self.performSegue(withIdentifier: "presentNeverEndingJokes", sender: self)
        
    }
    
}


// MARK: - Convenience methods

extension CNMainJokesViewController {
    
    func showAlert(_ joke: String){
        let alert = UIAlertController(title: "Joke", message: joke , preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}




