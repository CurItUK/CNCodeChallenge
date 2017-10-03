//
//  CNServiceManagerTests.swift
//  CNCodeChallengeApp_
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//


import Foundation
import XCTest
@testable import CNCodeChallengeApp
class  CNServiceManagerTests: XCTestCase {

    let fakeURL:String = ""
    let jokesURL:String =  CNConstants.CNAPIUrls.randomURl
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_fetchJokes_nilSession_fails_ReturnsErrorCode100() {
        let expectation = self.expectation(description: "Failure Closure returns error code = 100")
        
        let serviceManager = CNServiceManager()
        serviceManager.session = nil
        
        serviceManager.fetchJokes(urlString: jokesURL,
                                  success: { (dataJokes) in
                                    
        },
                                  failure:{ (errorJokes) in
                                    if errorJokes.code == 100 {
                                        expectation.fulfill()
                                    }
                                    
                                    
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    func test_fetchJokes_nilURL_fails_ReturnsErrorCode100() {
        let expectation = self.expectation(description: "Failure  returns error code = 101")
        
        let serviceManager = CNServiceManager()
        
        serviceManager.fetchJokes(urlString: nil,
                                  success: { (jokesData) in
                                    
        },
                                  failure:{ (errorJokes) in
                                    if errorJokes.code == 101 {
                                        expectation.fulfill()
                                    }
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    func test_fetchJokes_invalidURL_fails_ReturnsErrorCode101() {
        let expectation = self.expectation(description: "Failure  returns error code = 101")
        
        let serviceManager = CNServiceManager()
        
        serviceManager.fetchJokes(urlString:fakeURL,
                                  success: { (jokesdata) in
                                    
        },
                                  failure:{ (errorjokes) in
                                    if errorjokes.code == 101 {
                                        expectation.fulfill()
                                    }
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    func test_fetchJokes_validJokesURL_callsDataTask_onURLSession_withTheSameURL() {
        
        guard let expectedURL = URL(string: jokesURL) else {
            return
        }
        
        let expectation = self.expectation(description: "Expected dataTask called on URLSession")
        
        let mockURLSession = MockCNURLSession()
        mockURLSession.dataTaskExpectation = (expectation, expectedURL)
        
        let serviceManager = CNServiceManager()
        serviceManager.session = mockURLSession
        
        
        serviceManager.fetchJokes(urlString: jokesURL,
                                  success: { (data) in
                                    
        },
                                  failure:{ (error) in
                                    
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    func test_fetchJokes_jokesValidURL_validDataTask_callsResume_onDataTask() {
        
        let expectation = self.expectation(description: "Expected dataTask called on URLSession")
        
        let mockCNURLSession = MockCNURLSession()
        mockCNURLSession._dataTask?.resumeExpectation = expectation
        
        let serviceManager = CNServiceManager()
        serviceManager.session = mockCNURLSession
        
        serviceManager.fetchJokes(urlString: jokesURL,
                                  success: { (data) in
                                    // do nothing
        },
                                  failure:{ (error) in
                                    // do nothing
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}




