//
//  MockCNNeverEndingJokesTableViewController.swift
//  CNCodeChallengeApp_
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import CNCodeChallengeApp
class MockCNNeverEndingJokesTableViewController : CNNeverEndingJokesTableViewControllerProtocol {
    
    var expectationSetNavigationTitle:XCTestExpectation?
  
  
    
    func setNavigationTitle(_ title:String) -> Void {
        expectationSetNavigationTitle?.fulfill()
        
    }
    
  
    
    func reloadTableView() {
        
    }
}
