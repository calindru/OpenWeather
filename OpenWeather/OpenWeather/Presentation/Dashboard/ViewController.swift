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
    
    var viewModel: ForecastsViewModeling?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadForecastsViews(offline: offlineSwitch?.isOn ?? false)
    }

    // MARK: - User actions
    
    @IBAction func offlineSwitchWasChanged(sender: UISwitch) {
        reloadForecastsViews(offline: sender.isOn)
    }
    
    // MARK: - Private methods
    
    fileprivate func fillUI() {        
        guard isViewLoaded, viewModel != nil else {
            return
        }
        
        forecastsCollection?.reloadData()
    }
    
    fileprivate func reloadForecastsViews(offline: Bool) {
        guard let collectionView = forecastsCollection else { return }
        
        dataSource = offline ? ForecastsLocalDataSource(collectionView: collectionView) : ForecastsWebDataSource(collectionView: collectionView)
        dataSource.getForecasts(completion: { [weak self] (viewModel: ForecastsViewModeling) in
            guard let strongSelf = self else { return }
            strongSelf.viewModel = viewModel
            strongSelf.fillUI()
        })
    }
}

