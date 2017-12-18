//
//  Forecast.swift
//  OpenWeather
//
//  Created by Calin Drule on 10/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

public struct Forecast: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case dt = "dt"
//        case main
//    }
    
    let dt: Int64?
    let main: ForecastMain
    
//    public init(from decoder: Decoder) throws {
//        self.daytime = try decoder.
//    }
    
}
