//
//  ForecastsWebDataSource.swift
//  OpenWeather
//
//  Created by Calin Drule on 17/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

class ForecastsWebDataSource: ForecastsDataSource {
    
    override func getForecasts(completion: @escaping ForecastsViewModelCompletion) {
        let city = ForecastsConstants.ForecastsCity
        ForecastsServices.getForecasts(city: city, countryCode: ForecastsConstants.ForecastsCountryCode) { [weak self] (receivedForecasts: Forecasts?, error: Error?) in
            guard let strongSelf = self else { return }
            
            if let forecasts = receivedForecasts {
                let forecastsViewModel = ForecastsViewModel(forecasts: forecasts, city: city)
                strongSelf.forecastsViewModel = forecastsViewModel
                completion(forecastsViewModel)
            }
    
        }
    }
}
