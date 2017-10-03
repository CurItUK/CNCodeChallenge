//
//  MockCNNeverEndingJokesTableViewCell.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//


import Foundation
import XCTest
@testable import CNCodeChallengeApp
class MockCNNeverEndingJokesTableViewCell: CNNeverEndingJokesTableViewCell {
    
    var expectationSetTitle:(XCTestExpectation, String)?
    var expectationSetDetail:(XCTestExpectation, String)?
    var expectationSetID:(XCTestExpectation, String)?
    
    override func setTitle(_ title: String) {
        guard let (expectation, expectedValue) = self.expectationSetTitle else {
            super.setTitle(title)
            return
        }
        
        if title.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setTitle(title)
    }
    
    
    override func setDetail(_ detail: String) {
        
        guard let (expectation, expectedValue) = self.expectationSetDetail else {
            super.setDetail(detail)
            return
        }
        
        if detail.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setDetail(detail)
    }
    
    override func setID(_ id: String) {
        
        guard let (expectation, expectedValue) = self.expectationSetID else {
            super.setID(id)
            return
        }
        
        if id.compare(expectedValue) == .orderedSame {
            expectation.fulfill()
        }
        
        super.setID(id)
    }
    
    
}





