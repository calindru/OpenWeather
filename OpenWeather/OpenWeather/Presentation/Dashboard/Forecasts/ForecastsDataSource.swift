//
//  ForecastsDataSource.swift
//  OpenWeather
//
//  Created by Calin Drule on 06/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

typealias ForecastsViewModelCompletion = (ForecastsViewModeling) -> Void

protocol ForecastsDataSourcing: UICollectionViewDataSource {
    func getForecasts(completion: @escaping ForecastsViewModelCompletion)
}

class ForecastsDataSource: NSObject, UICollectionViewDataSource, ForecastsDataSourcing {
    var forecastsViewModel: ForecastsViewModel?

    init(collectionView: UICollectionView) {
        super.init()
        collectionView.dataSource = self
    }
    
    // MARK: - Internal methods

    
    // MARK: - ForecastsDataSourcing methods
    
    func getForecasts(completion: @escaping ForecastsViewModelCompletion) {
        
    }
    
    // MARK: - UICollectionViewDataSource methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return forecastsViewModel?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastsViewModel?.numberOfCells(row: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
