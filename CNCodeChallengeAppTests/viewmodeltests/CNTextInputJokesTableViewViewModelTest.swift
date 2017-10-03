//
//  CNTextInputJokesTableViewViewModelTest.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation
import XCTest
@testable import CNCodeChallengeApp

class CNTextInputJokesTableViewViewModelTests: XCTestCase   {
    
    fileprivate var mockCNTextInputTableViewController:MockCNTextInputTableViewController?
    fileprivate var stubCNResponseData:Data?
    fileprivate var stubCNServiceManager:MockCNServiceManager?
    fileprivate var cnjokesStubbedServiceManager:CNJokes?
    
    fileprivate var arrayWithOneJoke: [CNJoke]?
    
    
    
    override func setUp() {
        super.setUp()
        mockCNTextInputTableViewController = MockCNTextInputTableViewController()
        let bundle = Bundle(for: type(of:self))
        let path = bundle.path(forResource: "ValidSingleJoke", ofType: "json")
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
extension CNTextInputJokesTableViewViewModelTests {
    
    func test_Init_ValidView_InstantiatesObject() {
        let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        XCTAssertNotNil(sut)
    }
    
    func test_Init_ValidView_CopiesViewToIvar() {
        let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        
        if let lhs = mockCNTextInputTableViewController, let rhs = sut.view as? MockCNTextInputTableViewController {
            XCTAssertTrue(lhs === rhs)
        }
    }
    
    func test_Init_ValidView_AlbumIVarIsNotNil() {
          let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        XCTAssertNotNil(sut.cnjokes)
    }
    
}

// MARK: numberOfSections  tests
extension CNTextInputJokesTableViewViewModelTests {
    func test_NumberOfSections_ValidViewModel_WithJokes_Retur1() {
        let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        XCTAssertEqual(sut.numberOfSections(), 1)
    }
    
    func test_NumberOfSections_ValidViewModel_NilJokes_ReturnsZero() {
        let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        sut.cnjokes = nil
        XCTAssertEqual(sut.numberOfSections(), 0)
    }
    
    
}

//MARK:  numberOfRowsInSection tests
extension CNTextInputJokesTableViewViewModelTests{
    func test_NumberOfRowsInSection_ValidViewModel_Nil_Jokes_ReturnsZero() {
         let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        sut.cnjokes = nil
        
        XCTAssertEqual(sut.numberOfRowsInSection(0), 0)
    }
    
    func test_NumberOfRowsInSection_NegtiveSectionIndex_ReturnsZero() {
         let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        
        
        XCTAssertEqual(sut.numberOfRowsInSection(-1), 0)
    }
    
    func test_NumberOfRowsInSection_OutOfBoundsSectionIndex_ReturnsZero() {
         let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        
        XCTAssertEqual(sut.numberOfRowsInSection(1000), 0)
    }
    func test_NumberOfRowsInSection_ValidSectionIndex_ReturnsExpectedValue() {
         let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        print(sut.numberOfRowsInSection(0), sut.cnjokes!.jokes!.count)
        XCTAssertEqual(sut.numberOfRowsInSection(0), sut.cnjokes!.jokes!.count)
    }
    
}


//MARK:  searchForJokes tests
extension CNTextInputJokesTableViewViewModelTests{
    
    func test_SearchForJokes_ValidViewModel_WhenFirstNameIsNotSet_Returns_Alert() {
        let expectation = self.expectation(description: "Invalid First Name Show Alert Called")
        let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
       // let emptyFirstName = ""
        let lastName = "Norris"
        mockCNTextInputTableViewController!.showAlertExpectation = expectation
    
        sut.searchForJokes(lastName)
        self.waitForExpectations(timeout: 1.0, handler: nil)
        
        
    }
    
    func test_SearchForJokes_ValidViewModel_WhenLastNameIsNotSet_Returns_Alert() {
        let expectation = self.expectation(description: "Invalid Last Name Show Alert Called")
        let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        // let emptyFirstName = ""
        let firstName = "Chuck "
        mockCNTextInputTableViewController!.showAlertExpectation = expectation
        
        sut.searchForJokes(firstName)
        self.waitForExpectations(timeout: 1.0, handler: nil)
        

    }
    
    func test_SearchForJokes_ValidViewModel_WhenNameIsSet_Returns_Joke() {
       let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        let firstName = "Chuck Norris"
        
        
        sut.searchForJokes(firstName)
       
        XCTAssertEqual(sut.numberOfRowsInSection(0), sut.cnjokes!.jokes!.count)
        
        
    }

    
}




//MARK:  cellViewModel tests
extension CNTextInputJokesTableViewViewModelTests{
    
    func test_CellViewModel_ValidViewModelWhenJokesNil_ReturnsNil() {
          let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        sut.cnjokes?.jokes = nil
        
        XCTAssertNil(sut.cellViewModel(forIndexPath:IndexPath(row: 0, section: 0)))
    }
    
    
    func test_CellViewModel_RowIndexLessThan0_ReturnsNil() {
        
          let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        sut.cnjokes?.jokes = [CNJoke]()
        
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: -1, section: 0)))
        
        
    }
    
    func test_CellViewModel_RowIndexEqualToNumberOfJokes_ReturnsNil() {
          let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        sut.cnjokes?.jokes = [CNJoke]()
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: 1, section: 0)))
    }
    
    func test_CellViewModel_OutOfBoundsRowIndex_ReturnsNil() {
       let sut = CNTextInputJokesTableViewViewModel(view:mockCNTextInputTableViewController!, title: "Title")
        
        XCTAssertNil(sut.cellViewModel(forIndexPath: IndexPath(row: 1000, section: 0)))
    }
    
    
}





