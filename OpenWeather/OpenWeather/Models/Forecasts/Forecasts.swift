//
//  Forecasts.swift
//  OpenWeather
//
//  Created by Calin Drule on 17/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

public struct Forecasts: Decodable {
    let list: [Forecast]
    
    init(list: [Forecast]) {
        self.list = list
    }
}
