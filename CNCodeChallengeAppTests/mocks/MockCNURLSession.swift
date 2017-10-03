//
//  MockCNURLSession.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import CNCodeChallengeApp
class MockCNURLSession : CNURLSessionProtocol {
    
    var dataTaskExpectation:(XCTestExpectation, expectedURL:URL)?
    var _dataTask:MockCNURLSessionDataTask?
    
    init() {
        self._dataTask = MockCNURLSessionDataTask()
    }
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        if let (expectation, expectedValue) = self.dataTaskExpectation {
            if expectedValue.absoluteString.compare(url.absoluteString) == .orderedSame {
                expectation.fulfill()
            }
        }
        
        self._dataTask?.completionHandler = completionHandler
        return self._dataTask!
    }
    
}
