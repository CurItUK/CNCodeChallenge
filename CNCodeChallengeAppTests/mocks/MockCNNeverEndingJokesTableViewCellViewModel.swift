//
//  MockCNNeverEndingJokesTableViewCellViewModel.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//¡	

import Foundation
import XCTest
@testable import CNCodeChallengeApp
class MockCNNeverEndingJokesTableViewCellViewModel : CNNeverEndingJokesTableViewCellViewModel {
    
    var setupExpectation: XCTestExpectation?
   
    
    override func setup() {
        setupExpectation?.fulfill()
    }
    
    
}
