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
        static let noCellReuseIdentifier = "NoCell"
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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.noCellReuseIdentifier,
                                                         for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.forecastsHeaderReuseIdentifier, for: indexPath) as? ForecastsCollectionViewHeader {
            sectionHeader.titleLabel.text = forecastsViewModel?.date(at: indexPath.section)
            sectionHeader.forecastsViewModel = forecastsViewModel
            sectionHeader.sectionNo = indexPath.section
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
}
