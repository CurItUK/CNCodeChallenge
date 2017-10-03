//
//  MockCNMainJokesViewController.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//



import Foundation
import UIKit
import XCTest

@testable import CNCodeChallengeApp
class MockCNMainJokesViewController: CNMainJokesViewControllerProtocol {
    
    
    var expectationEnableRandomJokeButton:(XCTestExpectation, Bool)?
    var expectationTextInputJokeButton:(XCTestExpectation, Bool)?
    var expectationNeverEndingJokesButton:(XCTestExpectation, Bool)?
    var getRandomJokeExpectation: XCTestExpectation?
    
    
    func enableRandomJokeButton(_ state:Bool) {
        if let (expectation, expectedValue) = self.expectationEnableRandomJokeButton {
            if state == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func enableTextInputJokeButton(_ state:Bool) {
        if let (expectation, expectedValue) = self.expectationTextInputJokeButton {
            if state == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    
    func enableNeverEndingJokesButton(_ state:Bool) {
        if let (expectation, expectedValue) = self.expectationNeverEndingJokesButton {
            if state == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func getRandomJoke(){
    
        getRandomJokeExpectation!.fulfill()
        getRandomJokeExpectation =  nil
    
    }
    
    
    func displayNeverEndingJokesScreen() {}
    
    func showAlert(_ joke: String)  {}
    
    
    
}
