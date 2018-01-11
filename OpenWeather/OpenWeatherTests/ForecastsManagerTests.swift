//
//  ForecastsManagerTests.swift
//  OpenWeatherTests
//
//  Created by Calin Drule on 11/01/2018.
//  Copyright © 2018 Calin Drule. All rights reserved.
//

import XCTest

@testable import OpenWeather

class ForecastsManagerTests: XCTestCase {
    var sut: ForecastsManager!
    var filePath: String!
    let offlineRetriever = ForecastsLocalRetriever()
    let onlineRetriever = ForecastsWebRetriever()
    
    override func setUp() {
        super.setUp()
        sut = ForecastsManager.shared
        filePath = ForecastsManager.Constants.forecastsFilePath
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        filePath = nil
    }
    
    func testGetForecasts_Offline_UsesOfflineRetriever() {
        ForecastsManager.retrieveForecasts(resourceStrategy: offlineRetriever, completion: { _ in })
        
        XCTAssertNotNil(sut.resourceStrategy)
        XCTAssert(sut.resourceStrategy is ForecastsLocalRetriever)
    }
    
    func testGetForecasts_Offline_InvalidDataGeneratesNoResult() {
        let invalidData = "invalid data"
        _ = OWFileManager.write(text: invalidData, to: filePath)
        let expectation = XCTestExpectation(description: "The retrieved forecasts view model should be nil.")
        
        ForecastsManager.retrieveForecasts(resourceStrategy: offlineRetriever) { (viewModel: ForecastsViewModeling?) in
            
            if viewModel == nil {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testGetForecasts_Online_UsesOnlineRetriever() {
        ForecastsManager.retrieveForecasts(resourceStrategy: onlineRetriever, completion: { _ in })
        
        XCTAssertNotNil(sut.resourceStrategy)
        XCTAssert(sut.resourceStrategy is ForecastsWebRetriever)
    }
    
    func testGetForecasts_Online_PersistsToFile() {
        let invalidData = "invalid data"
        _ = OWFileManager.write(text: invalidData, to: filePath)
        let expectation = XCTestExpectation(description: "Retrieved forecasts should be written to file after download.")
            
        ForecastsManager.retrieveForecasts(resourceStrategy: onlineRetriever) { (viewModel: ForecastsViewModeling?) in
            
            if let readData = OWFileManager.read(relativePath: self.filePath), readData != invalidData {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
