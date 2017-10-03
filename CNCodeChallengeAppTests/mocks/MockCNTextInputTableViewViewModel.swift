//
//  MockCNTextInputTableViewViewModel.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//


import Foundation
import XCTest
@testable import CNCodeChallengeApp
class MockCNTextInputTableViewViewModel : CNTextInputJokesTableViewViewModel {
    
    var initialViewSetupExpectation: XCTestExpectation?
    var numberOfSectionsExpectation: XCTestExpectation?
    var numberOfRowsInSectionExpectation: (XCTestExpectation , numRows:Int)?
    var cellViewModelExpectation: (XCTestExpectation, expectedIndexPath:IndexPath)?
    var searchForJokesExpectation:  (XCTestExpectation? , enteredtext:String)?
    var setNavigationTitleExpectation: XCTestExpectation?
    
    
    
    override func searchForJokes(_ enteredtext: String?) {
        
        if let (expectation, expectedValue) = self.searchForJokesExpectation {
            if enteredtext?.compare(expectedValue) == .orderedSame {
                expectation?.fulfill()
            }
        }
        
        
        
        super.searchForJokes(enteredtext )
    }
    
    
    override func initialViewSetup() {
        initialViewSetupExpectation?.fulfill()
        
        initialViewSetupExpectation = nil
    }
    
    override   func setNavigationTitle(_ title:String){
    
        self.setNavigationTitleExpectation?.fulfill()
         self.setNavigationTitleExpectation = nil
    }
    
    
  override  func numberOfSections() -> Int {
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
