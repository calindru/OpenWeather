//
//  ForecastsManager.swift
//  OpenWeather
//
//  Created by Calin Drule on 22/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

class ForecastsManager {
    
    fileprivate struct Constants {
        static let forecastsFilePath = "Persistence/StoredForecasts.csv"
        static let csvSeparator = ", "
    }
    
    // MARK: - Public methods
    
    public class func retrieveForecasts(offline: Bool, completion: @escaping ForecastsViewModelCompletion) {
        if offline {
            getPersistedForecasts(completion: completion)
        } else {
            getOnlineForecasts(completion: completion)
        }
    }
    
    // MARK: - Private methods
    
    fileprivate class func getPersistedForecasts(completion: @escaping ForecastsViewModelCompletion) {
        Threading.executeOnSecondaryThread {
            let fileContent = OWFileManager.read(relativePath: Constants.forecastsFilePath)
            let forecastsViewModel = ForecastsViewModel(csvString: fileContent ?? "", separator: Constants.csvSeparator, city: selectedCity())
            
            Threading.executeOnMainThread {
                completion(forecastsViewModel)
            }
        }
    }
    
    fileprivate class func getOnlineForecasts(completion: @escaping ForecastsViewModelCompletion) {
        let city = selectedCity()
        ForecastsServices.getForecasts(city: city, countryCode: ForecastsConstants.ForecastsCountryCode) { (receivedForecasts: Forecasts?, error: Error?) in
            
            if let forecasts = receivedForecasts {
                let forecastsViewModel = ForecastsViewModel(forecasts: forecasts, city: city)
                persistForecasts(forecasts: forecastsViewModel)
                completion(forecastsViewModel)
                return
            }
            
            completion(nil)
        }
    }
    
    fileprivate class func persistForecasts(forecasts: ForecastsViewModeling?) {
        let csvString = forecasts?.csvSerializedString(separator: Constants.csvSeparator) ?? ""
        _ = OWFileManager.write(text: csvString, to: Constants.forecastsFilePath)
    }
    
    fileprivate class func selectedCity() -> String {
        return ForecastsConstants.ForecastsCity
    }
}
