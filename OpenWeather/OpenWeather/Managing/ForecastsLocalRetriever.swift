//
//  ForecastsLocalRetriever.swift
//  OpenWeather
//
//  Created by Calin Drule on 07/01/2018.
//  Copyright © 2018 Calin Drule. All rights reserved.
//

import UIKit

class ForecastsLocalRetriever: ForecastsResourceRetriever {
    
    func getForecasts(city: String, completion: @escaping ForecastsRetrieverCompletion) {
        Threading.executeOnSecondaryThread {
            let fileContent = OWFileManager.read(relativePath: ForecastsManager.Constants.forecastsFilePath)
            let forecastsViewModel = ForecastsViewModel(csvString: fileContent ?? "", separator: ForecastsConstants.csvSeparator, city: city)
            
            Threading.executeOnMainThread {
                completion(forecastsViewModel, ForecastsResources.local)
            }
        }
    }
}
