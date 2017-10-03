//
//  CNNeverEndingJokesTableViewCellTests.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.
//

import Foundation

import XCTest
@testable import CNCodeChallengeApp

class CNNeverEndingJokesTableViewCellTests: XCTestCase {
    
    private var validCNJoke:CNJoke?
    private var validDic:DicType?
    
    let joke = "joke"
    let title = "title"
    let detail = "detail"
    fileprivate var mockCNCell:CNNeverEndingJokesTableViewCell?

    
    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: CNNeverEndingJokesTableViewCell!

    override func setUp() {
        super.setUp()
        validDic = [String : AnyObject]()
        validDic![CNConstants.CNAPIKey.idKey] = ID(1) as AnyObject
        validDic![CNConstants.CNAPIKey.jokeKey] = Joke("This is Chuck Norris Joke") as AnyObject

        
        validCNJoke = CNJoke(validDic)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ctr = storyboard.instantiateViewController(withIdentifier: "NeverEndingJokesTableViewController") as! CNNeverEndingJokesTableViewController
         _ = ctr.view
        
        tableView = ctr.tableView
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: "RandomJokesTableViewCellIdentifier", for: IndexPath(row: 0, section: 0)) as! CNNeverEndingJokesTableViewCell
   }

    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_HasJokeTitle() {
       
         XCTAssertNotNil(cell.jokeTitle)
      
    }
    
    func test_HasJokeDetail() {
        
        XCTAssertNotNil(cell.jokeDetail)
        
    }
    
    func test_HasJokeID() {
        
        XCTAssertNotNil(cell.jokeID)
        
    }
    
 
    
    
    func testSetup_ValidViewModel_Calls_Setup_OnViewModel() {
        
        let expectation = self.expectation(description: "expected setup() called")
        
        let sut = CNNeverEndingJokesTableViewCell()
        sut.jokeDetail = UILabelStub()
        sut.jokeID = UILabelStub()
        
        
        let viewModel = MockCNNeverEndingJokesTableViewCellViewModel(model: validCNJoke )
        viewModel!.setupExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.setup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    

    func test_SetTitle_ValidViewModel_Calls_SetTitle_OnViewModel() {
        
        let expectation = self.expectation(description: "expected setTitle() called")
        
        let sut = CNNeverEndingJokesTableViewCell()
        sut.jokeDetail = UILabelStub()
        sut.jokeID = UILabelStub()
        
        
        let viewModel = MockCNNeverEndingJokesTableViewCellViewModel(model: validCNJoke )
        viewModel!.setupExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.setup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
 
    
}






extension CNNeverEndingJokesTableViewCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

 
