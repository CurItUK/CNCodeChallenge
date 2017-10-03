//
//  CNJokeTests.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

import XCTest
@testable import CNCodeChallengeApp
class CNJokeTests: XCTestCase {
    
    var invalidDic: [String: AnyObject]?
    var missingIDDic: [String: AnyObject]?
    var validDic: [String:AnyObject]?
    var missingTitleDic: [String:AnyObject]?
    var missingDetailseDic: [String:AnyObject]?
    
    override func setUp() {
        super.setUp()
        
        validDic = [String : AnyObject]()
        validDic![CNConstants.CNAPIKey.idKey] = ID(1) as AnyObject
        validDic![CNConstants.CNAPIKey.jokeKey] = Joke("This is Chuck Norris Joke") as AnyObject
        
        missingIDDic = [String : AnyObject]()
        missingIDDic!["detail"] = "This is Chuck Norris Joke" as AnyObject
        
        
        missingDetailseDic = [String : AnyObject]()
        missingDetailseDic!["id"] = "1" as AnyObject
        
        
    }
    override func tearDown() {
        
        super.tearDown()
    }
}

// MARK: Initialisation

extension CNJokeTests {
    
    func test_Init_NilDictionary_ReturnsNilJokes() {
        let sut = CNJoke(nil)
        XCTAssertNil(sut)
    }
    
    func test_Init_Dictionary_WhenIDisMissing_ReturnsNilJokes() {
        let sut = CNJoke(missingIDDic)
        XCTAssertNil(sut)
    }
    
    
    
    func test_Init_Dictionary_WhenDetailsMissing_ReturnsNilJokes() {
        let sut = CNJoke(missingDetailseDic)
        XCTAssertNil(sut)
    }
    
    func test_Init_ValidDictionary_CreateJokes() {
        let sut = CNJoke(validDic)
        XCTAssertNotNil(sut)
        
    }
    
    func test_Init_ValidDictionary_CreatesID() {
        let sut = CNJoke(validDic)
        XCTAssertEqual(sut!.id!, validDic?[CNConstants.CNAPIKey.idKey] as! ID)
    }
    
    func test_Init_ValidDictionary_CreatesJoke() {
        let sut = CNJoke(validDic)
        XCTAssertEqual(sut!.joke!, validDic?[CNConstants.CNAPIKey.jokeKey] as! Joke)
    }
    
}



