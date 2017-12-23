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
    
    public class func persistForecasts(forecasts: ForecastsViewModeling) {
        let csvString = forecasts.csvSerializedString(separator: Constants.csvSeparator)
        _ = OWFileManager.write(text: csvString, to: Constants.forecastsFilePath)
    }
    
    public class func getPersistedForecasts(city: String) -> ForecastsViewModeling {
        let fileContent = OWFileManager.read(relativePath: Constants.forecastsFilePath)
        return ForecastsViewModel(csvString: fileContent ?? "", separator: Constants.csvSeparator, city: city)
    }
}
