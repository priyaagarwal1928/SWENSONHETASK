//
//  AnagramsTests.swift
//  AnagramsTests
//
//  Created by Priya Agarwal on 03/01/2021.
//

import XCTest
@testable import Anagrams

class AnagramsTests: XCTestCase {
    
    var objAnagram : Anagrams!
    
    override func setUp() {
        
      super.setUp()
        
        objAnagram = Anagrams()
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        objAnagram = nil
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }

    func testWhetherStringsAreNagramOrNot()  {
        
        let firstString = "hello"
        let secondString = "nine thumps"

        
        let isAnagram = objAnagram.checkForAnagram(firstStr: firstString, secondStr:secondString)
                
   
        if isAnagram
        {
            XCTAssertTrue(isAnagram, "\(firstString) and \(secondString) are Anagram strings")
        }
        else
        {
           //XCTAssertFalse(isAnagram, "\(firstString) and \(secondString) are not Anagram strings")
            
            XCTFail("\(firstString) and \(secondString) are not Anagram strings")
        }
        
       

    }

}
