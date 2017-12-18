//
//  ForecastsViewModel.swift
//  OpenWeather
//
//  Created by Calin Drule on 18/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

typealias ForecastDate = String

protocol ForecastsViewModeling {
    var dates: [ForecastDate] { get }
    var forecastViewModels: [ForecastDate: [ForecastViewModel]] { get }
    
    init(forecasts: Forecasts, city: String)
    func numberOfRows() -> Int
    func numberOfCells(row: Int) -> Int
}

class ForecastsViewModel: NSObject, ForecastsViewModeling {
    var dates = [ForecastDate]()
    var forecastViewModels = [ForecastDate: [ForecastViewModel]]()
    
    struct Formatter {
        static let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter
        }()
    }
    
    required init(forecasts model: Forecasts, city: String) {
        dates = [ForecastDate]()
        forecastViewModels = [ForecastDate: [ForecastViewModel]]()
        
        for forecastData in model.list {
            let forecastViewModel = ForecastViewModel(forecast: forecastData, city: city)
            if let forecastDate = forecastViewModel.forecastDate {
                let datePretty = Formatter.dateFormatter.string(from: forecastDate)
                dates.append(datePretty)
                self.forecastViewModels[datePretty]?.append(forecastViewModel)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return dates.count
    }
    
    func numberOfCells(row: Int) -> Int {
        guard row < dates.count else { return 0 }
        
        let forecastDate = dates[row]
        return forecastViewModels[forecastDate]?.count ?? 0
    }
}
