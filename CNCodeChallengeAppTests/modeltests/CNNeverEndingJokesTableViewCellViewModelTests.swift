//
//  CNNeverEndingJokesTableViewCellViewModelTests.swift
//  CNCodeChallengeApp
//
//  Created by dexter-local on 30/09/2017.
//  Copyright © 2017 curiousit. All rights reserved.

import XCTest
@testable import CNCodeChallengeApp
class CNNeverEndingJokesTableViewCellViewModelTests: XCTestCase {
    fileprivate var mockCNNeverEndingJokesTableViewCell:MockCNNeverEndingJokesTableViewCell?
    
    fileprivate var model: CNJoke?
    var titleStub:UILabelStub?
    var jokeDetailStub:UILabelStub?
    var jokeIDStub: UILabelStub?
    let title = "joketitle"
    let joke  = "Chuck norris Joke"
    let id    =  132
    
    let idKey = "id"
    let titleKey = "title"
    let jokeKey  = "joke"
    var validDic: [String : AnyObject]?
    override func setUp() {
        super.setUp()
        
        validDic = [String : AnyObject]()
        validDic![idKey] = id as AnyObject
        validDic![titleKey] = title as AnyObject
        validDic![jokeKey] = joke as AnyObject
        
        
        self.model  = CNJoke(validDic)
        mockCNNeverEndingJokesTableViewCell = MockCNNeverEndingJokesTableViewCell()
        titleStub = UILabelStub()
        jokeDetailStub = UILabelStub()
        jokeIDStub = UILabelStub()
        mockCNNeverEndingJokesTableViewCell!.jokeTitle = titleStub
        mockCNNeverEndingJokesTableViewCell!.jokeDetail = jokeDetailStub
          mockCNNeverEndingJokesTableViewCell!.jokeID = jokeIDStub
    }
    override func tearDown() {
        
        super.tearDown()
    }
}


// MARK: initialization tests
extension CNNeverEndingJokesTableViewCellViewModelTests {
    
    func test_Init_NilModel_DoesNotInstantiateObject() {
        let sut = CNNeverEndingJokesTableViewCellViewModel(model:nil)
        XCTAssertNil(sut)
    }
    
    func testInit_ValidModel_InstantiatesObject() {
        let sut = CNNeverEndingJokesTableViewCellViewModel(model:nil)
        XCTAssertNil(sut)
    }
    
    func testInit_ValidModel_CopiesModelToIvar() {
        let sut =  CNNeverEndingJokesTableViewCellViewModel(model:model)
        XCTAssertTrue(model === sut?.model!)
    }
    
}


//MARK: set Tests 
extension CNNeverEndingJokesTableViewCellViewModelTests {


 
    func test_ValidJoke_Calls_SetTitle(){
      
        var validDic1 = [String : AnyObject]()
        validDic1[idKey] = ID(id) as AnyObject
        validDic1[titleKey] = String(title) as AnyObject

        validDic1[jokeKey] = Joke(joke) as AnyObject
        let expectation = self.expectation(description: "expected setTitle() to be called")
         mockCNNeverEndingJokesTableViewCell?.expectationSetTitle = (expectation, "joketitle")
        let sut = CNNeverEndingJokesTableViewCellViewModel(model:CNJoke(validDic1))
        sut?.view = mockCNNeverEndingJokesTableViewCell
 
        sut!.setTitle( self.title )
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }


    func test_ValidJoke_Calls_SetID(){
        
        var validDic1 = [String : AnyObject]()
        validDic1[idKey] = ID(id) as AnyObject
        validDic1[titleKey] = String(title) as AnyObject
        
        validDic1[jokeKey] = Joke(joke) as AnyObject
        let expectation = self.expectation(description: "expected setID() to be called")
        mockCNNeverEndingJokesTableViewCell?.expectationSetID = (expectation, "132")
        let sut = CNNeverEndingJokesTableViewCellViewModel(model:CNJoke(validDic1))
        sut?.view = mockCNNeverEndingJokesTableViewCell
        
        sut!.setID( String(self.id) )
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }


    func test_ValidJoke_Calls_SetDetail(){
        
        var validDic1 = [String : AnyObject]()
        validDic1[idKey] = ID(id) as AnyObject
        validDic1[titleKey] = String(title) as AnyObject
        
        validDic1[jokeKey] = Joke(joke) as AnyObject
        let expectation = self.expectation(description: "expected setDetail() to be called")
        mockCNNeverEndingJokesTableViewCell?.expectationSetDetail = (expectation, self.joke)
        let sut = CNNeverEndingJokesTableViewCellViewModel(model:CNJoke(validDic1))
        sut?.view = mockCNNeverEndingJokesTableViewCell
        
        sut!.setDetail(self.joke )
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

}





