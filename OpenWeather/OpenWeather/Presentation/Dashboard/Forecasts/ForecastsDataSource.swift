//
//  ForecastsDataSource.swift
//  OpenWeather
//
//  Created by Calin Drule on 06/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

protocol ForecastsDataSourcing: UICollectionViewDataSource {
    func getForecasts()
}

class ForecastsDataSource: NSObject, UICollectionViewDataSource, ForecastsDataSourcing {
    var forecasts: Forecasts?
    var forecastsCollectionView: UICollectionView!
    
    init(collectionView: UICollectionView) {
        super.init()
        self.forecastsCollectionView = collectionView
    }
    
    // MARK: - Internal methods
    
    func reloadData() {
        forecastsCollectionView.reloadData()
    }
    
    // MARK: - ForecastsDataSourcing methods
    
    func getForecasts() {
        
    }
    
    // MARK: - UICollectionViewDataSource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
