//
//  QwertyDvorakSwiftTests.swift
//  QwertyDvorakSwiftTests
//
//  Created by Alex Weisberger on 3/9/16.
//  Copyright © 2016 AMW. All rights reserved.
//

import XCTest

class QwertyDvorakSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            let file = "/usr/share/dict/words"
            do {
                let full_dict = try NSString(contentsOfFile: file, encoding: NSUTF8StringEncoding)
                let q_to_d: Dictionary<Character, Character> = [
                    "a" : "a",
                    "b" : "x",
                    "c" : "j",
                    "d" : "e",
                    "f" : "u",
                    "g" : "i",
                    "h" : "d",
                    "i" : "c",
                    "j" : "h",
                    "k" : "t",
                    "l" : "n",
                    "m" : "m",
                    "n" : "b",
                    "o" : "r",
                    "p" : "l",
                    "r" : "p",
                    "s" : "o",
                    "t" : "y",
                    "u" : "g",
                    "v" : "k",
                    "x" : "q",
                    "y" : "f"
                ]
                convert_and_check(full_dict, conversion_map: q_to_d)
            }
            catch {
                print("No such file")
            }
        }
    }
    
}
