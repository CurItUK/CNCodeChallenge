//
//  CNMainJokesViewModelTests.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.

import Foundation
import XCTest
@testable import CNCodeChallengeApp
class CNMainJokesViewModelTests: XCTestCase {
    
    fileprivate var mockCNMainJokesViewController:MockCNMainJokesViewController?
    fileprivate var stubResponseData:Data?
    fileprivate var stubServiceManager:CNServiceManager?
    fileprivate var cnjokesWithStubbedServiceManager:CNJokes?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockCNMainJokesViewController = MockCNMainJokesViewController()
        
        stubServiceManager = CNServiceManager()
        cnjokesWithStubbedServiceManager = CNJokes()
        cnjokesWithStubbedServiceManager!.cnserviceManager = stubServiceManager!
        
        
  
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}

// MARK: initialization tests
extension CNMainJokesViewModelTests {
    
    func test_Init_ValidView_InstantiatesObject() {
        let sut = CNMainJokesViewModel(view:mockCNMainJokesViewController!)
        XCTAssertNotNil(sut)
    }
    
    func test_Init_ValidView_CopiesViewToIvar() {
        let sut = CNMainJokesViewModel(view:mockCNMainJokesViewController!)
        
        if let lhs = mockCNMainJokesViewController, let rhs = sut.view as? MockCNMainJokesViewController {
            XCTAssertTrue(lhs === rhs)
        }
    }
    
    
}


//MARK: getRandomJoke Tests
extension CNMainJokesViewModelTests {
    
    func test_GetRandomJoke_ReturnsJoke() {
      //  let expectation = self.expectation(description: "expected getRandomJoke to be called")
       // mockCNMainJokesViewController!.getRandomJokeExpectation = expectation
        let sut = CNMainJokesViewModel(view:mockCNMainJokesViewController!)
        
        sut.cnjokes = cnjokesWithStubbedServiceManager
       
        sut.getRandomJoke()
        
        
        
        
        XCTAssertNotNil( sut.cnjokes!.jokes!)
    
    }
    /*
    func test_GetRandomJoke_Calls_GetRandomJoke() {
          let expectation = self.expectation(description: "expected getRandomJoke to be called")
       
        let sut = CNMainJokesViewModel(view:mockCNMainJokesViewController!)
        mockCNMainJokesViewController!.getRandomJokeExpectation = expectation
        sut.cnjokes = cnjokesWithStubbedServiceManager
        
        sut.getRandomJoke()
        
        
        
        
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
*/

}


// MARK: InitialViewSetup tests
extension CNMainJokesViewModelTests {
    
    func test_InitialViewSetup_EnablesRandomJokeButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableRandomJokeButton(true) to be called")
        mockCNMainJokesViewController!.expectationEnableRandomJokeButton = (expectation, true)
        
        let sut = CNMainJokesViewModel(view:mockCNMainJokesViewController!)
        sut.initialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func test_InitialViewSetup_EnablesTextInputJokeButton_OnViewController() {
        let expectation = self.expectation(description: "expected textInputJokeButton(true) to be called")
        mockCNMainJokesViewController!.expectationTextInputJokeButton = (expectation, true)
        
        let sut = CNMainJokesViewModel(view:mockCNMainJokesViewController!)
        sut.initialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_InitialViewSetup_EnablesNeverEndingJokeButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableneverEndingJokeButton(true) to be called")
        mockCNMainJokesViewController!.expectationNeverEndingJokesButton = (expectation, true)
        
        let sut = CNMainJokesViewModel(view:mockCNMainJokesViewController!)
        sut.initialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}





