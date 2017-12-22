//
//  Threading.swift
//  OpenWeather
//
//  Created by Calin Drule on 22/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

class Threading {
    static func executeOnMainThread(closure: @escaping () -> Void) {
        DispatchQueue.main.async(execute: closure)
    }
    
    static func executeOnSecondaryThread(closure: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: closure)
    }
}
