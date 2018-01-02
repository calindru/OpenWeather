//
//  OWFileManagerTests.swift
//  OpenWeatherTests
//
//  Created by Calin Drule on 28/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import XCTest

@testable import OpenWeather

class OWFileManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWrite_emptyPath() {
        let error = OWFileManager.write(text: "", to: "")
        XCTAssertNotNil(error)
    }
    
    func testWrite_pathHasNoFile() {
        let error = OWFileManager.write(text: "", to: "/Directory1")
        XCTAssertNotNil(error)
    }
    
    func testWrite_canCreateNewDirectories() {
        let error = OWFileManager.write(text: "", to: "/Directory1/Directory2/test.txt")
        XCTAssertNil(error)
    }
    
    func testWrite_pathDoesntNeedToStartWithSlash() {
        let error = OWFileManager.write(text: "", to: "/test.txt")
        XCTAssertNil(error)
        let error2 = OWFileManager.write(text: "", to: "test.txt")
        XCTAssertNil(error2)
    }
    
    func testRead_fileNotFound() {
        let readText = OWFileManager.read(relativePath: "file/not/found/path/txt.file")
        XCTAssertNil(readText)
    }
    
    func testReadWrite_fullCycle() {
        let path = "/Directory1/test.txt"
        let writtenText = "To be or not to be?"
        let writeError = OWFileManager.write(text: writtenText, to: path)
        XCTAssertNil(writeError)
        let readText = OWFileManager.read(relativePath: path)
        XCTAssertEqual(writtenText, readText)
    }
    
    func testReadWrite_overwriteExistingFile() {
        let path = "test.txt"
        let error1 = OWFileManager.write(text: "oldText", to: path)
        XCTAssertNil(error1)
        let newText = "asdf"
        let error2 = OWFileManager.write(text: newText, to: path)
        XCTAssertNil(error2)
        let readText = OWFileManager.read(relativePath: path)
        XCTAssertEqual(readText, newText)
    }
}
