//
//  ForecastsLocalDataSource.swift
//  OpenWeather
//
//  Created by Calin Drule on 17/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

class ForecastsLocalDataSource: ForecastsDataSource {
    
    override func getForecasts(completion: @escaping ForecastsViewModelCompletion) {
        Threading.executeOnSecondaryThread { [weak self] in
            guard let strongSelf = self else { return }
            
            let forecastsViewModel = ForecastsManager.getPersistedForecasts(city: ForecastsConstants.ForecastsCity)
            strongSelf.forecastsViewModel = forecastsViewModel
            Threading.executeOnMainThread {
                completion(forecastsViewModel)
            }
        }
    }
}
