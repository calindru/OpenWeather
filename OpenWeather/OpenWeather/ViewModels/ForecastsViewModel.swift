//
//  ForecastsViewModel.swift
//  OpenWeather
//
//  Created by Calin Drule on 18/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

protocol ForecastsViewModeling {
    var date: String { get }
    var forecasts: [ForecastViewModel] { get }
}

class ForecastsViewModel: NSObject, ForecastsViewModeling {
    var date = ""
    var forecasts = [ForecastViewModel]()
    
    
}
