//
//  MockCNNeverEndingJokesTableViewViewModel.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//



import Foundation
import XCTest
@testable import CNCodeChallengeApp
class MockCNNeverEndingJokesTableViewViewModel: CNNeverEndingJokesTableViewViewModel {
    
    var initialViewSetupExpectation: XCTestExpectation?
    var numberOfSectionsExpectation: XCTestExpectation?
    var numberOfRowsInSectionExpectation: (XCTestExpectation, expectedSectionIndex:Int)?
    var viewDidAppearExpectation: XCTestExpectation?
  
    var cellViewModelExpectation:(XCTestExpectation, expectedIndexPath:IndexPath)?
    
    override func initialViewSetup() {
        initialViewSetupExpectation?.fulfill()
        
        initialViewSetupExpectation = nil
    }
  
    override func viewDidAppear() {
        viewDidAppearExpectation?.fulfill()
        viewDidAppearExpectation = nil
    
    
    }
    
    override func numberOfSections() -> Int {
        numberOfSectionsExpectation?.fulfill()
        return 0
    }
    
    override func numberOfRowsInSection(_ section:Int) -> Int {
        //numberOfRowsInSectionExpectation?.fulfill()
        if let (expectation, expectedValue) = self.numberOfRowsInSectionExpectation {
            if section == expectedValue {
                expectation.fulfill()
            }
        }
        
        return 0
    }
    
    
    
    
    
    
    override func cellViewModel(forIndexPath indexPath:IndexPath) -> CNNeverEndingJokesTableViewCellViewModel? {
        if let (expectation, expectedValue) = self.cellViewModelExpectation {
            if indexPath == expectedValue {
                expectation.fulfill()
                
            }
        }
        
        return nil
    }
    
    
    
    
    
}







