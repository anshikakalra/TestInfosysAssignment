//
//  TestInfosysApplicationFactModel.swift
//  TestInfosysApplicationTests
//
//  Created by Anshika on 21/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import XCTest
@testable import TestInfosysApplication

class TestInfosysApplicationFactModel: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_ShouldTakeAndSet_Title_Description_ImageHRef() {
        let item = FactModel(title: "Test title",
                            description: "Test description",
                            imageHref: "Test Image HRef")
        XCTAssertEqual(item.title, "Test title")
        XCTAssertEqual(item.description, "Test description")
        XCTAssertEqual(item.imageHref, "Test Image HRef")
    }

}
