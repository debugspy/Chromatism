//
//  JLScopeTests.swift
//  Chromatism
//
//  Created by Johannes Lund on 2014-07-14.
//  Copyright (c) 2014 anviking. All rights reserved.
//

import UIKit
import XCTest

let ChromatismTestsDefaultTheme = ColorTheme.default

class JLScopeTests: XCTestCase {
    
    let blue = UIColor.blue
    let green = UIColor.green
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testSubscripting() {

        let a = JLScope()
        let b = JLScope()
        let c = JLScope()
        let d = JLScope()
        let e = JLScope()
        let f = JLScope()
        let g = JLScope()
        let h = JLScope()
        
        a[
            b[c,d],
            e[f],
            g,
            h
        ]
        
        XCTAssert(a.subscopes == [b,e,g,h], "")
        XCTAssert(b.subscopes == [c,d], "")
        XCTAssert(e.subscopes == [f], "")
        XCTAssert(g.subscopes.count == 0, "")
        XCTAssert(h.subscopes.count == 0, "")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }

}

extension String {
    // I'm lazy
    var comment: NSMutableAttributedString { return attributedStringWithTokenType(.comment) }
    var text: NSMutableAttributedString { return attributedStringWithTokenType(.text) }
    var keyword: NSMutableAttributedString { return attributedStringWithTokenType(.keyword) }
    
    func attributedStringWithTokenType(_ token: JLTokenType) -> NSMutableAttributedString {
        let colors = ColorTheme.default.dictionary
        return NSMutableAttributedString(string: self, attributes: [NSForegroundColorAttributeName:colors[token]! ])
    }
}

 func + (left: AttributedString, right: AttributedString) -> NSMutableAttributedString {
    let string = left.mutableCopy() as! NSMutableAttributedString
    string.append(right)
    return string
}
