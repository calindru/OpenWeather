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
    
    var offlineMode: Bool {
        get {
            return offlineSwitch?.isOn ?? false
        }
    }
    
    var dataSource: ForecastsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadForecastsViews(offline: offlineMode)
    }

    // MARK: - User actions
    
    @IBAction func offlineSwitchWasChanged(sender: UISwitch) {
        reloadForecastsViews(offline: sender.isOn)
    }
    
    // MARK: - Private methods
    
    fileprivate func fillUI() {        
        guard isViewLoaded else { return }
        
        forecastsCollection?.reloadData()
    }
    
    fileprivate func reloadForecastsViews(offline: Bool) {
        guard let collectionView = forecastsCollection else { return }
        
        ForecastsManager.retrieveForecasts(offline: offline, completion: { [weak self] (viewModel: ForecastsViewModeling?) in
            guard let strongSelf = self else { return }
            strongSelf.dataSource = ForecastsDataSource(collectionView: collectionView, forecasts: viewModel)
            strongSelf.fillUI()
        })
    }
}

