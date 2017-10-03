//
//  CNTextInputTableViewControllertests.swift
//  CNCodeChallengeApp_
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest

@testable import CNCodeChallengeApp

class CNTextInputTableViewControllertests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
  
    
}

//   




//MARK: ViewDidLoad Tests
extension CNTextInputTableViewControllertests {
    
 
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        let sut = CNTextInputTableViewController()
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_ViewModelIsNotNilAfterViewDidLoad() {
        let sut = CNTextInputTableViewController()
        sut.viewDidLoad()
        
        XCTAssertNotNil(sut.viewModel)
    }
    

    
    
}







//MARK: InitialViewSetup Tests
extension CNTextInputTableViewControllertests {
    
   func test_InitialSetup_OnViewModel() {
    
    weak var expectation = self.expectation(description: "expecting initialViewSetup()  called")
    
    let sut = CNTextInputTableViewController()
    
     let viewModel = MockCNTextInputTableViewViewModel(view:sut , title: "Never Ending Jokes")
    viewModel.initialViewSetupExpectation = expectation
    
    sut.viewModel = viewModel
    
    sut.viewDidLoad()
    
    self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    

}


//MARK: setNavigationTitleTests
extension CNTextInputTableViewControllertests {
    
    func test_setNavigationTitle_OnViewModel() {
        
        weak var expectation = self.expectation(description: "expecting setNavigationTitle()  called")
        
        let sut = CNTextInputTableViewController()
        
        let viewModel = MockCNTextInputTableViewViewModel(view:sut , title: "Never Ending Jokes")
        viewModel.setNavigationTitleExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.setNavigationTitle("title")
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}




//MARK: numberOfSections Tests
extension CNTextInputTableViewControllertests {
    
    func test_NumberOfSections_Calls_NumberOfSections_OnViewModel() {
        let expectation = self.expectation(description: "expecting numberOfSections() called")
        
        
        let sut = CNTextInputTableViewController()
        
        let viewModel = MockCNTextInputTableViewViewModel(view:sut , title: "Never Ending Jokes")
  
        viewModel.numberOfSectionsExpectation = expectation
        
        sut.viewModel = viewModel
        
        let _ = sut.numberOfSections(in: UITableViewStub())
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}

//--


//MARK: searchForJokes Tests
extension CNTextInputTableViewControllertests {
    
    func test_SearchForTextNumberOfSections_Calls_SearchForText_OnViewModel() {
        let expectation = self.expectation(description: "expecting searchForJokes() called")
        
        
        let sut = CNTextInputTableViewController()
        
        let viewModel = MockCNTextInputTableViewViewModel(view:sut , title: "Never Ending Jokes")
        sut.searchText = "Chuck Norris"
        viewModel.searchForJokesExpectation = (expectation , sut.searchText!)
        
        sut.viewModel = viewModel
        
        sut.searchForJokes()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}

//--


//MARK: Test numberOfRowsInSection
extension CNTextInputTableViewControllertests {
    
    
    func test_NumberOfRowsInSection_ValidViewModel_Calls_NumberOfRowsInSection_OnViewModel() {
        
        let expectation = self.expectation(description: "expecting  numberOfItemsInSection()  called")
        
        let sut = CNTextInputTableViewController()
        
        let stubbedTableView = UITableViewStub()
        sut.view = stubbedTableView
        
        let viewModel = MockCNTextInputTableViewViewModel(view:sut , title: "Text Input Jokes")
        viewModel.numberOfRowsInSectionExpectation = (expectation, 1)
        
        sut.viewModel = viewModel
        
        let _ = sut.tableView(stubbedTableView, numberOfRowsInSection: 1)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


 //MARK: cellviewmodel Tests
 extension CNTextInputTableViewControllertests {
 
 func test_CellForRow_ValidViewModel_Calls_CellViewModel_OnViewModel() {
 
 let expectation = self.expectation(description: "expecting cellViewModel() called")
 
 let stubbedTableView = UITableViewStub()
 
 let sut = CNNeverEndingJokesTableViewController()
 sut.view = stubbedTableView
 
 let viewModel = MockCNNeverEndingJokesTableViewViewModel(view:sut , title: "Text Input Jokes")
 viewModel.cellViewModelExpectation = (expectation, IndexPath(row: 0, section: 0))
 
 sut.viewModel = viewModel
 
 let _ = sut.tableView(stubbedTableView, cellForRowAt: IndexPath(row: 0, section: 0))
 
 //let _ = sut.tableView(stubbedTableView)
 
 self.waitForExpectations(timeout: 1.0, handler: nil)
 }
 
 }
 














