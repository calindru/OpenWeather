//
//  ForecastsViewControllerTests.swift
//  OpenWeatherTests
//
//  Created by Calin Drule on 12/01/2018.
//  Copyright © 2018 Calin Drule. All rights reserved.
//

import XCTest

@testable import OpenWeather

class FakeForecastsViewController: ViewController {
    var offlineSwitchActionMethodCalled = false
    
    @IBAction override func offlineSwitchWasChanged(sender: UISwitch) {
        offlineSwitchActionMethodCalled = true
    }
}

class FakeForecastsManager: ForecastsManager {
    var retrieveForecastsCalled = false

    static let fakeShared = FakeForecastsManager()
        
    override public class func retrieveForecasts(resourceStrategy : ForecastsResourceRetriever, completion: @escaping ForecastsViewModelCompletion) {
        fakeShared.retrieveForecastsCalled = true
    }
}

class ForecastsViewControllerTests: XCTestCase {
    var sutFake: FakeForecastsViewController!
    var sutOriginal: ViewController!
    
    override func setUp() {
        super.setUp()
        
        sutFake = FakeForecastsViewController()
        let forecastsViewController = self.forecastsViewController()
        sutFake.offlineSwitch = forecastsViewController.offlineSwitch
        
        let tapEvent = UIControlEvents.valueChanged
        if let actions = sutFake.offlineSwitch?.actions(forTarget: forecastsViewController, forControlEvent: tapEvent) {
            for action in actions {
                sutFake.offlineSwitch?.addTarget(sutFake, action: Selector(action), for: tapEvent)
            }
        }
        
        sutOriginal = self.forecastsViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        sutFake = nil
        sutOriginal = nil
    }
    
    func testOfflineSwitch_notNil() {
        XCTAssertNotNil(sutFake.offlineSwitch)
    }
    
    func testOfflineSwitchWasChanged_CallsRetrieveForecasts_WithOfflineResourceStrategy() {
        sutOriginal.offlineSwitch!.isOn = true
        sutOriginal.offlineSwitchWasChanged(sender: sutOriginal.offlineSwitch!)
        XCTAssert(ForecastsManager.shared.resourceStrategy is ForecastsLocalRetriever)
    }
    
    func testOfflineSwitchWasChanged_CallsRetrieveForecasts_WithOnlineResourceStrategy() {
        sutOriginal.offlineSwitch!.isOn = false
        sutOriginal.offlineSwitchWasChanged(sender: sutOriginal.offlineSwitch!)
        XCTAssert(ForecastsManager.shared.resourceStrategy is ForecastsWebRetriever)
    }
    
    // MARK: - Helper methods
    
    fileprivate func forecastsViewController() -> ViewController {
        let forecastsViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as! ViewController
        _ = forecastsViewController.view
        return forecastsViewController
    }
}
