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

struct ForecastViewModel: ForecastViewModeling {
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
    
    init(forecast: Forecast, city: String) {
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
    
    init(csvString: String, separator: String, city: String) {
        self.city = city
        
        let forecastDetails = csvString.components(separatedBy: separator)
        if forecastDetails.count > ForecastsFileFields.time.rawValue {
            time = forecastDetails[ForecastsFileFields.time.rawValue]
        }
        if forecastDetails.count > ForecastsFileFields.temperature.rawValue {
            temperature = forecastDetails[ForecastsFileFields.temperature.rawValue]
        }
    }
    
    func csvSerializedString(separator: String) -> String {
        // Saved information format:
        // time, temperature
        // eg. 09:00:00, 291.12
        return time + separator + temperature
    }
}
