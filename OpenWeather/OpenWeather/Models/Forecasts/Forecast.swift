//
//  Forecast.swift
//  OpenWeather
//
//  Created by Calin Drule on 10/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

public struct Forecast: Decodable {    
    let dt: Int64?
    let main: ForecastMain?
}
