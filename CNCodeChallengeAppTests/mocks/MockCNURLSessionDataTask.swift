//
//  MockCNURLSessionDataTask.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import CNCodeChallengeApp
class MockCNURLSessionDataTask : URLSessionDataTask {
    
    var resumeExpectation: XCTestExpectation?
    
    var completionHandler:((Data?, URLResponse?, Error?) -> Swift.Void)?
    var dataToReturn:Data?
    var urlResponseToReturn:URLResponse?
    var errorToReturn:Error?
    
    override func resume() {
        resumeExpectation?.fulfill()
        
        if let completionHandler = completionHandler {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                completionHandler(self.dataToReturn, self.urlResponseToReturn, self.errorToReturn)
            }
        }
    }
}
