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
    
    func csvSerializedString(separator: String) -> String
    
    static func forecastViewModel(forecast: Forecast, city: String) -> ForecastViewModeling
    static func forecastViewModel(csvString: String, separator: String, city: String) -> ForecastViewModeling
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
    
    static func forecastViewModel(forecast: Forecast, city: String) -> ForecastViewModeling {
        var forecastViewModel = ForecastViewModel()
        forecastViewModel.city = city
        
        if let daytime = forecast.dt {
            let date = Date(timeIntervalSince1970: Double(daytime))
            forecastViewModel.forecastDate = date
            forecastViewModel.time = Formatter.timeFormatter.string(from: date)
        }
        
        if let main = forecast.main {
            forecastViewModel.temperature = String(main.temp)
        }
        
        return forecastViewModel
    }
    
    static func forecastViewModel(csvString: String, separator: String, city: String) -> ForecastViewModeling {
        var forecastViewModel = ForecastViewModel()
        forecastViewModel.city = city
        
        let forecastDetails = csvString.components(separatedBy: separator)
        if forecastDetails.count > ForecastsFileFields.time.rawValue {
            forecastViewModel.time = forecastDetails[ForecastsFileFields.time.rawValue]
        }
        if forecastDetails.count > ForecastsFileFields.temperature.rawValue {
           forecastViewModel.temperature = forecastDetails[ForecastsFileFields.temperature.rawValue]
        }
        
        return forecastViewModel
    }
    
    func csvSerializedString(separator: String) -> String {
        // Saved information format:
        // time, temperature
        // eg. 09:00:00, 291.12
        return time + separator + temperature
    }
}
