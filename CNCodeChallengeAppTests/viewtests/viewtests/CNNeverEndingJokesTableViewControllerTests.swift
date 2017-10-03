//
//  CNNeverEndingJokesTableViewControllerTests.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 29/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//


import Foundation

import XCTest
@testable import CNCodeChallengeApp
class CNNeverEndingJokesTableViewControllerTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
}

//MARK: ViewDidLoad Tests
extension CNNeverEndingJokesTableViewControllerTests {
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        let sut = CNNeverEndingJokesTableViewController()
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_ViewModelIsNotNilAfterViewDidLoad() {
        let sut = CNNeverEndingJokesTableViewController()
        sut.viewDidLoad()

        XCTAssertNotNil(sut.viewModel)
    }
    
}
//MARK: InitialViewSetup Tests
extension CNNeverEndingJokesTableViewControllerTests {
    
    func test_InitialSetup_OnViewModel() {
        
        weak var expectation = self.expectation(description: "expecting initialViewSetup()  called")
        
        let sut = CNNeverEndingJokesTableViewController()
        
        let viewModel = MockCNNeverEndingJokesTableViewViewModel(view:sut , title: "Never Ending Jokes")
        viewModel.initialViewSetupExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.viewDidLoad()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}
//MARK: numberOfSections Tests
extension CNNeverEndingJokesTableViewControllerTests {
    
    func test_NumberOfSections_Calls_NumberOfSections_OnViewModel() {
        let expectation = self.expectation(description: "expecting numberOfSections() called")
        
        let sut = CNNeverEndingJokesTableViewController()
        
        let viewModel = MockCNNeverEndingJokesTableViewViewModel(view:sut , title: "Never Ending Jokes")
        viewModel.numberOfSectionsExpectation = expectation
        
        sut.viewModel = viewModel
        
        let _ = sut.numberOfSections(in: UITableViewStub())
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
   
    func test_NumberOfSections_ReturnsNil_WhenViewModelIsNil_OnViewModel() {
       
        
        let sut = CNNeverEndingJokesTableViewController()

        let stubbedTableView = UITableViewStub()
        
        sut.viewModel = nil
        
        XCTAssertEqual(sut.numberOfSections(in: stubbedTableView) , 0)
        
    }
    
}


//MARK: ViewDidAppear Tests
extension CNNeverEndingJokesTableViewControllerTests {
    
    
    func test_ViewDidAppear_ValidViewModel_Calls_ViewDidAppear_OnViewModel() {
        
        let expectation = self.expectation(description: "expecting  viewdidappear()  called")
        
        let sut = CNNeverEndingJokesTableViewController()
        
        let stubbedTableView = UITableViewStub()
        sut.view = stubbedTableView
        
        let viewModel = MockCNNeverEndingJokesTableViewViewModel(view:sut , title: "Never Ending Jokes")
        viewModel.viewDidAppearExpectation =  expectation
        
        sut.viewModel = viewModel
        
        let _ = sut.viewDidAppear(false )
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


//MARK: testNumberOfRowsInSection Tests
extension CNNeverEndingJokesTableViewControllerTests {
    
    
    func test_NumberOfItemsInSection_ValidViewModel_Calls_NumberOfItemsInSection_OnViewModel() {
        
        let expectation = self.expectation(description: "expecting  numberOfItemsInSection()  called")
        
        let sut = CNNeverEndingJokesTableViewController()
        
        let stubbedTableView = UITableViewStub()
        sut.view = stubbedTableView
        
        let viewModel = MockCNNeverEndingJokesTableViewViewModel(view:sut , title: "Never Ending Jokes")
        viewModel.numberOfRowsInSectionExpectation = (expectation, 1)
        
        sut.viewModel = viewModel
        
        let _ = sut.tableView(stubbedTableView, numberOfRowsInSection: 1)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


 //MARK: cellviewmodel Tests
 extension CNNeverEndingJokesTableViewControllerTests {
 
 func test_CellForItem_ValidViewModel_Calls_CellViewModel_OnViewModel() {
 
 let expectation = self.expectation(description: "expecting cellViewModel() called")
 
 let stubbedTableView = UITableViewStub()
 
 let sut = CNNeverEndingJokesTableViewController()
 sut.view = stubbedTableView
 
 let viewModel = MockCNNeverEndingJokesTableViewViewModel(view:sut , title: "Never Ending Jokes")
 viewModel.cellViewModelExpectation = (expectation, IndexPath(row: 0, section: 0))
 
 sut.viewModel = viewModel
    
 
  let _ = sut.tableView(stubbedTableView, cellForRowAt: IndexPath(row: 0, section: 0))
 
 //let _ = sut.tableView(stubbedTableView)
 
 self.waitForExpectations(timeout: 1.0, handler: nil)
 }
 
 }
 
 
