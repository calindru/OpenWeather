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
    
    var dataSource: ForecastsDataSource!
    var forecastsResourceRetriever: ForecastsResourceRetriever = ForecastsWebRetriever()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadForecastsViews()
    }

    // MARK: - User actions
    
    @IBAction func offlineSwitchWasChanged(sender: UISwitch) {
        forecastsResourceRetriever = (offlineSwitch?.isOn)! ? ForecastsLocalRetriever() : ForecastsWebRetriever()
        reloadForecastsViews()
    }
    
    // MARK: - Private methods
    
    fileprivate func fillUI() {        
        guard isViewLoaded else { return }
        
        forecastsCollection?.reloadData()
    }
    
    fileprivate func reloadForecastsViews() {
        guard let collectionView = forecastsCollection else { return }
        
        ForecastsManager.retrieveForecasts(resourceStrategy: forecastsResourceRetriever, completion: { [weak self] (viewModel: ForecastsViewModeling?) in
            guard let strongSelf = self else { return }
            strongSelf.dataSource = ForecastsDataSource(collectionView: collectionView, forecasts: viewModel)
            strongSelf.fillUI()
        })
    }
}

