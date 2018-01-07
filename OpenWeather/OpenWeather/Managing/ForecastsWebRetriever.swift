//
//  ForecastsWebRetriever.swift
//  OpenWeather
//
//  Created by Calin Drule on 07/01/2018.
//  Copyright © 2018 Calin Drule. All rights reserved.
//

import UIKit

class ForecastsWebRetriever: ForecastsResourceRetriever {
    func getForecasts(city: String, completion: @escaping ForecastsRetrieverCompletion) {
        ForecastsServices.getForecasts(city: city, countryCode: ForecastsConstants.forecastsCountryCode) { (receivedForecasts: Forecasts?, error: Error?) in
            let resource = ForecastsResources.web
            if let forecasts = receivedForecasts {
                let forecastsViewModel = ForecastsViewModel.forecastsViewModel(forecasts: forecasts, city: city)
                completion(forecastsViewModel, resource)
                return
            }
            
            completion(nil, resource)
        }
    }
}
