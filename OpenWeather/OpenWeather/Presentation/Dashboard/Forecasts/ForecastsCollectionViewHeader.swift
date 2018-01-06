//
//  ForecastsCollectionViewHeader.swift
//  OpenWeather
//
//  Created by Calin Drule on 20/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

class ForecastsCollectionViewHeader: UICollectionReusableView, UICollectionViewDataSource {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var forecastDayCollectionView: UICollectionView!
    
    var forecastsViewModel: ForecastsViewModeling? {
        didSet {
            forecastDayCollectionView.reloadData()
            forecastDayCollectionView.dataSource = self
        }
    }
    var sectionNo: Int = 0
    
    fileprivate struct Constants {
        static let forecastsCellReuseIdentifier = "ForecastCell"
    }
    
    // MARK: - UICollectionViewDataSource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastsViewModel?.numberOfCells(row: sectionNo) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.forecastsCellReuseIdentifier,
                                                      for: indexPath) as! ForecastCollectionViewCell
        if cell.layer.borderWidth != 1 {
            cell.layer.borderColor = UIColor.darkGray.cgColor
            cell.layer.borderWidth = 1
        }
        
        let dataIndexPath = IndexPath(row: indexPath.row, section: sectionNo)
        let forecastViewModel = forecastsViewModel?.forecastViewModel(for: dataIndexPath)
        cell.temperatureLabel.text = forecastViewModel?.temperature
        cell.timeLabel.text = forecastViewModel?.time
        cell.cityLabel.text = forecastViewModel?.city
        cell.temperatureUnitsLabel.isHidden = forecastViewModel?.temperature.count == 0
        
        return cell
    }
}
