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
}

class ForecastViewModel: NSObject, ForecastViewModeling {
    var time = ""
    var city = ""
    var temperature = ""
    
    struct Formatter {
        static let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter
        }()
        static let timeFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            return dateFormatter
        }()
    }
    
    
}
