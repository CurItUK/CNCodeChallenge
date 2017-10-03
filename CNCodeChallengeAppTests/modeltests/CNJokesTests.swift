//
//  CNJokesTests.swift
//  CNCodeChallengeApp_
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest

@testable import CNCodeChallengeApp

class CNJokesTests: XCTestCase {
    
    
    
    fileprivate let invalidURl: String  = ""
    fileprivate let validURL  = CNConstants.CNAPIUrls.randomBaseurl
    fileprivate let validSingleTextURL = "http://api.icndb.com/jokes/random/?firstName=chuck&lastName=norris"
    
    override func setUp () {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    
}

//MARk: Init Tests
extension CNJokesTests {
    
    func testInit_JokeArrayIsNotNil() {
        let cnJokes = CNJokes()
        XCTAssertNotNil(cnJokes.jokes)
        
    }
    
    
    func testInit_JokeArrayIsEmpty() {
        let cnJokes = CNJokes()
        XCTAssertNotNil(cnJokes.jokes!.count, String(0) )
        
    }
    
}

//MARK : Load tests
extension CNJokesTests {
    
    func test_Load_whenURLisnil_ReturnsError_Code101() {
        
        let expectation = self.expectation(description: "Returns Error Code= 101")
        
        let sut = CNJokes()
        sut.load(urlString: nil,
                 
                 success: { (Void) in
                    
        },
                 failure: { (error) in
                    
                    if error.code == 101 {
                        expectation.fulfill()
                    }
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    func test_Load_whenURLisInvalid_ReturnsError_Code101() {
        
        let expectation = self.expectation(description: "Returns Error Code= 101")
        
        let sut = CNJokes()
        sut.load(urlString: invalidURl,
                 
                 success: { (Void) in
                    
        },
                 failure: { (error) in
                    
                    if error.code == 101 {
                        expectation.fulfill()
                    }
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_Load_whenURLisValid_callsfetchJokes_withExpectedURL() {
        
        let expectation = self.expectation(description: "Expecting fetchJokes to be called")
        
        let mockCNServiceManager = MockCNServiceManager()
        mockCNServiceManager.fetchJokesExpectation = (expectation, validURL)
        
        let sut = CNJokes()
        sut.cnserviceManager = mockCNServiceManager
        
        sut.load(urlString: validURL,
                 
                 success: { (Void) in
                    
        },
                 failure: { (error) in
                    
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_Load_whenURLisValid_failsWhenCNServiceManagerFails() {
        let expectation = self.expectation(description: "Expecting fetchJokes to be called")
        
        let mockCNServiceManager = MockCNServiceManager()
        mockCNServiceManager.shouldFailOnFetch = true
        
        let sut = CNJokes()
        sut.cnserviceManager = mockCNServiceManager
        
        sut.load(urlString: validURL,
                 
                 success: { (Void) in
                    
        },
                 failure: { (error) in
                    expectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_Load_onCNServiceManager_WhenFails_doesNotUpdateJokes() {
        
        let mockCNServiceManager = MockCNServiceManager()
        mockCNServiceManager.shouldFailOnFetch = true
        
        let sut = CNJokes()
        sut.cnserviceManager = mockCNServiceManager
        sut.load(urlString: validURL,
                 
                 success: { (Void) in
                    
        },
                 failure: { (error) in
                    // expectation.fulfill()
        })
        
        XCTAssertEqual(sut.jokes?.count, 0)
        
    }
    
    func test_Load_whenURLisValid_CNServiceManager_ReturnsValidData_jokesArrayHasExpectedCount() {
        
        let bundle = Bundle(for: type(of:self))
        let filePath = bundle.path(forResource: "ValidJokesData", ofType: "json")
        let stubJsonData = try! Data(contentsOf: URL(fileURLWithPath: filePath!))
        
        let mockCNServiceManager = MockCNServiceManager()
        mockCNServiceManager.shouldFailOnFetch = false
        mockCNServiceManager.dataToReturnOnSuccess = stubJsonData
        
        let sut = CNJokes()
        sut.cnserviceManager = mockCNServiceManager
        
        sut.load(urlString: validURL, success: { (Void) in
            
        }, failure: { (error) in
            
        })
        
        XCTAssertEqual(sut.jokes?.count, 15)
    }
    
    
}

//MARK: LoadTextJoke Tests
extension CNJokesTests {
    
    func test_LoadTextJoke_whenURLisnil_ReturnsError_Code101() {
        
        let expectation = self.expectation(description: "Returns Error Code= 101")
        
        let sut = CNJokes()
        sut.loadTextJoke(urlString: nil,
                         
                         success: { (Void) in
                            
        },
                         failure: { (error) in
                            
                            if error.code == 101 {
                                expectation.fulfill()
                            }
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_LoadTextJoke_whenURLisInvalid_ReturnsError_Code101() {
        
        let expectation = self.expectation(description: "Returns Error Code= 101")
        
        let sut = CNJokes()
        sut.loadTextJoke(urlString: invalidURl,
                         
                         success: { (Void) in
                            
        },
                         failure: { (error) in
                            
                            if error.code == 101 {
                                expectation.fulfill()
                            }
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_LoadTextJoke_whenURLisValid_callsfetchJokes_withExpectedURL() {
        
        let expectation = self.expectation(description: "Expecting fetchJokes to be called")
        
        let mockCNServiceManager = MockCNServiceManager()
        mockCNServiceManager.fetchJokesExpectation = (expectation, validURL)
        
        let sut = CNJokes()
        sut.cnserviceManager = mockCNServiceManager
        
        sut.loadTextJoke(urlString: validURL,
                         
                         success: { (Void) in
                            
        },
                         failure: { (error) in
                            
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    func test_LoadTextJoke_whenURLisValid_failsWhenCNServiceManagerFails() {
        let expectation = self.expectation(description: "Expecting fetchJokes to be called")
        
        let mockCNServiceManager = MockCNServiceManager()
        mockCNServiceManager.shouldFailOnFetch = true
        
        let sut = CNJokes()
        sut.cnserviceManager = mockCNServiceManager
        
        sut.loadTextJoke(urlString: validURL,
                         
                         success: { (Void) in
                            
        },
                         failure: { (error) in
                            expectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func test_LoadTextJoke_onCNServiceManager_WhenFails_doesNotUpdateJokes() {
        
        let mockCNServiceManager = MockCNServiceManager()
        mockCNServiceManager.shouldFailOnFetch = true
        
        let sut = CNJokes()
        sut.cnserviceManager = mockCNServiceManager
        sut.loadTextJoke(urlString: validURL,
                         
                         success: { (Void) in
                            
        },
                         failure: { (error) in
                            // expectation.fulfill()
        })
        
        XCTAssertEqual(sut.jokes?.count, 0)
        
    }
    
    func test_LoadTextJoke_whenURLisValid_CNServiceManager_ReturnsValidData_jokesArrayHasExpectedCount() {
        
        let bundle = Bundle(for: type(of:self))
        let filePath = bundle.path(forResource: "ValidSingleJoke", ofType: "json")
        let stubJsonData = try! Data(contentsOf: URL(fileURLWithPath: filePath!))
        
        let mockCNServiceManager = MockCNServiceManager()
        mockCNServiceManager.shouldFailOnFetch = false
        mockCNServiceManager.dataToReturnOnSuccess = stubJsonData
        
        let sut = CNJokes()
        sut.cnserviceManager = mockCNServiceManager
        let firstName = "Chuck"
        let lastName = "norris"
        let  str = "\( CNConstants.CNAPIUrls.baseURl)/&firstName=\(firstName)&lastName=\(lastName)"
        sut.loadTextJoke(urlString: str,
                         success: { (Void) in
                            
        },
                         failure: { (error) in
                            print (error.description)
                            
                            
        })
        
        XCTAssertEqual(sut.jokes?.count, 1)
    }
    
    
    
    
}



