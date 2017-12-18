//
//  ForecastViewModel.swift
//  OpenWeather
//
//  Created by Calin Drule on 18/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

protocol ForecastViewModeling {
    var city: String { get }
    var temperature: String { get }
    var time: String { get }
    var forecastDate: Date? { get set }
    
    init(forecast: Forecast, city: String)
}

class ForecastViewModel: NSObject, ForecastViewModeling {
    var time = ""
    var city = ""
    var temperature = ""
    var forecastDate: Date?
    
    struct Formatter {
        static let timeFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter
        }()
    }
    
    required init(forecast: Forecast, city: String) {
        self.city = city
        
        if let daytime = forecast.dt {
            let date = Date(timeIntervalSince1970: Double(daytime))
            forecastDate = date
            self.time = Formatter.timeFormatter.string(from: date)
        }
        
        if let main = forecast.main {
            self.temperature = String(main.temp)
        }
    }
}
