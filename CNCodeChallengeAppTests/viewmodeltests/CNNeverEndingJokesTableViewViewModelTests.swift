//
//  CNNeverEndingJokesTableViewViewModelTests.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.

import Foundation
import XCTest
@testable import CNCodeChallengeApp
class CNNeverEndingJokesTableViewViewModelTests: XCTestCase {
    fileprivate var mockCNNeverEndingJokesTableViewController:MockCNNeverEndingJokesTableViewController?
    fileprivate var stubCNResponseData:Data?
    fileprivate var stubCNServiceManager:MockCNServiceManager?
    fileprivate var cnjokesStubbedServiceManager:CNJokes?
    
    fileprivate var arrayWithOneJoke: [CNJoke]?
    override func setUp() {
        super.setUp()
        mockCNNeverEndingJokesTableViewController = MockCNNeverEndingJokesTableViewController()
        let bundle = Bundle(for: type(of:self))
        let path = bundle.path(forResource: "ValidJokesData", ofType: "json")
        stubCNResponseData = try! Data(contentsOf: URL(fileURLWithPath: path!))
        
        stubCNServiceManager = MockCNServiceManager()
        stubCNServiceManager!.shouldFailOnFetch = false
        stubCNServiceManager!.dataToReturnOnSuccess = stubCNResponseData!
        
        cnjokesStubbedServiceManager = CNJokes()
        cnjokesStubbedServiceManager!.cnserviceManager = stubCNServiceManager!
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}

// MARK: initialization tests
extension CNNeverEndingJokesTableViewViewModelTests {
    
    func test_Init_ValidView_InstantiatesObject() {
        let sut = CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        XCTAssertNotNil(sut)
    }
    
    func test_Init_ValidView_CopiesViewToIvar() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        
        if let lhs = mockCNNeverEndingJokesTableViewController, let rhs = sut.view as? MockCNNeverEndingJokesTableViewController {
            XCTAssertTrue(lhs === rhs)
        }
    }
    
    func test_Init_ValidView_AlbumIVarIsNotNil() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        XCTAssertNotNil(sut.cnjokes)
    }
    
}

 /*
// MARK: viewDidAppear tests
extension CNNeverEndingJokesTableViewViewModelTests {
    
   
    func test_ViewDidAppear_Calls_ViewDidAppear_OnTableViewController() {
        let expectation = self.expectation(description: "expected viewDidAppear() called")
        mockCNNeverEndingJokesTableViewController!.viewDidAppearExpectation = expectation
        
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        sut.viewDidAppear()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    func test_ViewDidAppear_Calls_ViewDidAppear_OnTableViewController() {
    let expectation = self.expectation(description: "expected viewDidAppear() called")
        let sut = CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        mockCNNeverEndingJokesTableViewController!.viewDidAppearExpectation = expectation
         sut.viewDidAppear()
       self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
*/
// MARK: initialization tests
extension CNNeverEndingJokesTableViewViewModelTests {
    
    
        func test_InitialViewSetup_Calls_SetNavigationTitle_OnTableViewController() {
            let expectation = self.expectation(description: "expected setNavigationTitle() called")
            mockCNNeverEndingJokesTableViewController!.expectationSetNavigationTitle = expectation
            
            let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
            sut.initialViewSetup()
            
            self.waitForExpectations(timeout: 1.0, handler: nil)
            
        }
    
    
}


// MARK: numberOfSections  tests
extension CNNeverEndingJokesTableViewViewModelTests {
    func test_NumberOfSections_ValidViewModel_WithJokes_Retur1() {
        let sut = CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        XCTAssertEqual(sut.numberOfSections(), 1)
    }
    
    func test_NumberOfSections_ValidViewModel_NilJokes_ReturnsZero() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        sut.cnjokes = nil
        XCTAssertEqual(sut.numberOfSections(), 0)
    }
    
    
}

//MARK:  numberOfRowsInSection tests
extension CNNeverEndingJokesTableViewViewModelTests{
    func test_NumberOfRowsInSection_ValidViewModel_Nil_Jokes_ReturnsZero() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        sut.cnjokes = nil
        
        XCTAssertEqual(sut.numberOfRowsInSection(0), 0)
    }
    
    func test_NumberOfRowsInSection_NegtiveSectionIndex_ReturnsZero() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        
        
        XCTAssertEqual(sut.numberOfRowsInSection(-1), 0)
    }
    
    func test_NumberOfRowsInSection_OutOfBoundsSectionIndex_ReturnsZero() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        
        XCTAssertEqual(sut.numberOfRowsInSection(1000), 0)
    }
    func test_NumberOfRowsInSection_ValidSectionIndex_ReturnsExpectedValue() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        print(sut.numberOfRowsInSection(0), sut.cnjokes!.jokes!.count)
        XCTAssertEqual(sut.numberOfRowsInSection(0), sut.cnjokes!.jokes!.count)
    }
    
}


//MARK:  cellViewModel tests
extension CNNeverEndingJokesTableViewViewModelTests{
    
    func test_CellViewModel_ValidViewModelWhenJokesNil_ReturnsNil() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        sut.cnjokes?.jokes = nil
        
        XCTAssertNil(sut.cellViewModel(forIndexPath:IndexPath(row: 0, section: 0)))
    }
    
    
    func test_CellViewModel_RowIndexLessThan0_ReturnsNil() {
        
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        sut.cnjokes?.jokes = [CNJoke]()
        
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: -1, section: 0)))
        
        
    }
    
    func test_CellViewModel_RowIndexEqualToNumberOfJokes_ReturnsNil() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        sut.cnjokes?.jokes = [CNJoke]()
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: 1, section: 0)))
    }
    
    func test_CellViewModel_OutOfBoundsRowIndex_ReturnsNil() {
        let sut =  CNNeverEndingJokesTableViewViewModel(view:mockCNNeverEndingJokesTableViewController!, title: "Title")
        
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: 1000, section: 0)))
    }
    
    
}


