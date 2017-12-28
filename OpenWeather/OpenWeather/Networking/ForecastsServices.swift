//
//  ForecastsServices.swift
//  OpenWeather
//
//  Created by Calin Drule on 10/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import UIKit

public typealias ForecastsResponse = (Forecasts?, Error?) -> Void

class ForecastsServices: BaseServices {
    
    struct ForecastsServicesConstants {
        static let OpenWeatherURLFormat = "http://api.openweathermap.org/data/2.5/forecast?q=%@,%@&units=metric&mode=json&appid=86f8ecfd4470eac83eef12f9cd123294"
    }
    
    public static func getForecasts(city: String, countryCode: String, completion: @escaping ForecastsResponse) {
        let urlString = String(format: ForecastsServicesConstants.OpenWeatherURLFormat, city, countryCode)
        let escapedURLString = urlEncoded(url: urlString)
        
        callService(from: escapedURLString, completion: completion)
    }
}
