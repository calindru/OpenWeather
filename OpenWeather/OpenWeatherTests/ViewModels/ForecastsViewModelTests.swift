//
//  ForecastsViewModelTests.swift
//  OpenWeatherTests
//
//  Created by Calin Drule on 11/01/2018.
//  Copyright © 2018 Calin Drule. All rights reserved.
//

import XCTest

@testable import OpenWeather

class ForecastsViewModelTests: XCTestCase {
    
    let city = ForecastsConstants.forecastsCity
    let onlineForecastsData = ""
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_OnlineData_NoData() {
        let forecasts = Forecasts(list: [])
        let forecastsViewModel = ForecastsViewModel.forecastsViewModel(forecasts: forecasts, city: city)
        XCTAssertEqual(forecastsViewModel.numberOfRows(), 0)
    }
    
    func testInit_OnlineData_ValidData() {
        let forecastsData = ForecastsDummyData.onlineForecastsData.data(using: .utf8)
        let decoder = JSONDecoder()
        do {
            let forecasts = try decoder.decode(Forecasts.self, from: forecastsData!)
            let forecastsViewModel = ForecastsViewModel.forecastsViewModel(forecasts: forecasts, city: self.city)
            XCTAssertEqual(forecastsViewModel.numberOfRows(), 6)
        }
        catch {
            XCTFail()
        }
    }
    
    func testInit_OfflineData_InvalidData() {
        let fileContent = "invalid data"
        let forecastsViewModel = ForecastsViewModel.forecastsViewModel(csvString: fileContent, separator: ForecastsConstants.csvSeparator, city: city)
        XCTAssertEqual(forecastsViewModel.numberOfRows(), 0)
    }
    
    func testInit_OfflineData_NoData() {
        let fileContent = ""
        let forecastsViewModel = ForecastsViewModel.forecastsViewModel(csvString: fileContent, separator: ForecastsConstants.csvSeparator, city: city)
        XCTAssertEqual(forecastsViewModel.numberOfRows(), 0)
    }
    
    func testInit_OfflineData_ValidData() {
        let fileContent = ForecastsDummyData.offlineForecastsData
        let forecastsViewModel = ForecastsViewModel.forecastsViewModel(csvString: fileContent, separator: ForecastsConstants.csvSeparator, city: city)
        XCTAssertEqual(forecastsViewModel.numberOfRows(), 6)
        XCTAssertEqual(forecastsViewModel.numberOfCells(row: 4), 8)
    }
}
