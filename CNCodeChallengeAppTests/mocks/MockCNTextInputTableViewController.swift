//
//  MockCNTextInputTableViewController.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import CNCodeChallengeApp
class MockCNTextInputTableViewController:CNNeverEndingJokesTextInputProtocol  {
    var showAlertExpectation: XCTestExpectation?
    
    func showAlert(_ message: String) {
        showAlertExpectation?.fulfill()
        showAlertExpectation = nil
    }
    
    func setNavigationTitle(_ title:String)
    {
    }
    func reloadTableView(){
        
        
    }
    
}
