//
//  ForecastsDataSource.swift
//  OpenWeather
//
//  Created by Calin Drule on 06/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

typealias ForecastsViewModelCompletion = (ForecastsViewModeling?) -> Void

class ForecastsDataSource: NSObject, UICollectionViewDataSource {
    var forecastsViewModel: ForecastsViewModeling?

    fileprivate struct Constants {
        static let forecastsCellReuseIdentifier = "ForecastCell"
        static let forecastsHeaderReuseIdentifier = "ForecastsHeader"
    }
    
    init(collectionView: UICollectionView, forecasts: ForecastsViewModeling?) {
        super.init()
        collectionView.dataSource = self
        forecastsViewModel = forecasts
    }
    
    // MARK: - UICollectionViewDataSource methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return forecastsViewModel?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastsViewModel?.numberOfCells(row: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.forecastsCellReuseIdentifier,
                                                         for: indexPath) as! ForecastCollectionViewCell
        if cell.layer.borderWidth != 1 {
            cell.layer.borderColor = UIColor.darkGray.cgColor
            cell.layer.borderWidth = 1
        }
        
        let forecastViewModel = forecastsViewModel?.forecastViewModel(for: indexPath)
        cell.temperatureLabel.text = forecastViewModel?.temperature
        cell.timeLabel.text = forecastViewModel?.time
        cell.cityLabel.text = forecastViewModel?.city
        cell.temperatureUnitsLabel.isHidden = forecastViewModel?.temperature.count == 0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.forecastsHeaderReuseIdentifier, for: indexPath) as? ForecastsCollectionViewHeader {
            sectionHeader.titleLabel.text = forecastsViewModel?.date(at: indexPath.section)
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
}
