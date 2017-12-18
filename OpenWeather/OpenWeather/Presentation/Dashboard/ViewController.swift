//
//  ViewController.swift
//  OpenWeather
//
//  Created by Calin Drule on 06/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forecastsCollection: UICollectionView?
    @IBOutlet weak var offlineSwitch: UISwitch?
    
    var forecasts = [Forecast]()
    var offlineMode = false
    var dataSource: ForecastsDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let offlineSwitch = offlineSwitch {
            reloadForecastsViews(offline: offlineSwitch.isOn)
        }
    }

    // MARK: - User actions
    
    @IBAction func offlineSwitchWasChanged(sender: UISwitch) {
        reloadForecastsViews(offline: sender.isOn)
    }
    
    // MARK: - Private methods
    
    fileprivate func reloadForecastsViews(offline: Bool) {
        guard let collectionView = forecastsCollection else { return }
        
        dataSource = offline ? ForecastsLocalDataSource(collectionView: collectionView) : ForecastsWebDataSource(collectionView: collectionView)
        dataSource.getForecasts()
    }
}

