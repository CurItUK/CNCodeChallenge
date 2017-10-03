//
//  CNMainJokesViewControllerProtocol.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

protocol CNMainJokesViewControllerProtocol: class {
    func enableRandomJokeButton(_ state:Bool)
    func enableTextInputJokeButton(_ state:Bool)
    func enableNeverEndingJokesButton(_ state: Bool)
    func displayNeverEndingJokesScreen()
    func showAlert(_ joke: String)
    
}


