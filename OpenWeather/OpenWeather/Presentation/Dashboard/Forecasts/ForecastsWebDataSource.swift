//
//  ForecastsWebDataSource.swift
//  OpenWeather
//
//  Created by Calin Drule on 17/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

class ForecastsWebDataSource: ForecastsDataSource {
    
    override func getForecasts() {
        ForecastsServices.getForecasts(city: ForecastsConstants.ForecastsCity, countryCode: ForecastsConstants.ForecastsCountryCode) { [weak self] (receivedForecasts: Forecasts?, error: Error?) in
            guard let strongSelf = self else { return }
            guard error == nil else { return }
            
            strongSelf.forecasts = receivedForecasts
            strongSelf.reloadData()
        }
    }
}
