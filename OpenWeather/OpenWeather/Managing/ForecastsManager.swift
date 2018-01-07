//
//  ForecastsManager.swift
//  OpenWeather
//
//  Created by Calin Drule on 22/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

typealias ForecastsRetrieverCompletion = (ForecastsViewModeling?, ForecastsResources) -> Void

protocol ForecastsResourceRetriever {
    func getForecasts(city: String, completion: @escaping ForecastsRetrieverCompletion)
}

public enum ForecastsResources: Int {
    case local = 0
    case web
}

class ForecastsManager {
    
    static let shared = ForecastsManager()
    
    var resourceStrategy: ForecastsResourceRetriever?
    
    struct Constants {
        static let forecastsFilePath = "Persistence/StoredForecasts.csv"
    }
    
    // MARK: - Public methods
    
    public class func retrieveForecasts(resourceStrategy : ForecastsResourceRetriever, completion: @escaping ForecastsViewModelCompletion) {
        shared.resourceStrategy = resourceStrategy
        resourceStrategy.getForecasts(city: selectedCity(), completion: {(viewModel: ForecastsViewModeling?, resource: ForecastsResources) in
            if resource == ForecastsResources.web {
                persistForecasts(forecasts: viewModel)
            }
            
            completion(viewModel)
        })
    }
    
    // MARK: - Private methods
    
    fileprivate class func persistForecasts(forecasts: ForecastsViewModeling?) {
        let csvString = forecasts?.csvSerializedString(separator: ForecastsConstants.csvSeparator) ?? ""
        _ = OWFileManager.write(text: csvString, to: Constants.forecastsFilePath)
    }
    
    fileprivate class func selectedCity() -> String {
        return ForecastsConstants.forecastsCity
    }
}
