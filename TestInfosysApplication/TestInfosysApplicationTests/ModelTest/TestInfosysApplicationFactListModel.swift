//
//  TestInfosysApplicationFactListModel.swift
//  TestInfosysApplicationTests
//
//  Created by Anshika on 21/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import XCTest
@testable import TestInfosysApplication

class TestInfosysApplicationFactListModel: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_ShouldSetTitle() {
        let infoItems = FactListModel(title: "Test title")
        XCTAssertEqual(infoItems.title, "Test title")
    }

    func testRowsCount_Initially_ShouldBeZero() {
        let sut = FactListModel(title: "Test title")
        XCTAssertEqual(sut.rows?.count, 0)
    }

}
