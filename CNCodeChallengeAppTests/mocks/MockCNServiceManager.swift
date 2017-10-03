//
//  MockCNServiceManager.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import CNCodeChallengeApp
class MockCNServiceManager : CNServiceManager {
    
    var fetchJokesExpectation:(XCTestExpectation, expectedURLString:String)?
    var shouldFailOnFetch:Bool = false
    var dataToReturnOnSuccess:Data?
    
    override func fetchJokes(urlString: String?, success: @escaping (Data) -> Void, failure: @escaping (NSError) -> Void) {
        
        if let (expectation, expectedValue) = self.fetchJokesExpectation {
            if urlString?.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
        
        if shouldFailOnFetch == true {
            failure(NSError(domain: "CNCodeChallengeApp.CNServiceManager", code:102, userInfo: nil))
            return
        }
        
        if let dataToReturnOnSuccess = dataToReturnOnSuccess {
            success(dataToReturnOnSuccess)
            return
        }
        
        super.fetchJokes(urlString: urlString, success: success, failure: failure)
    }
}

