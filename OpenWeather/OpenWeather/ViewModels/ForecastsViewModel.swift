//
//  ForecastsViewModel.swift
//  OpenWeather
//
//  Created by Calin Drule on 18/12/2017.
//  Copyright © 2017 Calin Drule. All rights reserved.
//

import Foundation

typealias ForecastDate = String

protocol ForecastsViewModeling {
    init(forecasts: Forecasts, city: String)
    func numberOfRows() -> Int
    func numberOfCells(row: Int) -> Int
    func forecastViewModel(for indexPath: IndexPath) -> ForecastViewModel?
    func date(at index: Int) -> ForecastDate?
    func csvSerializedString(separator: String) -> String
}

public enum ForecastsFileFields: Int {
    case date = 0
    case time
    case temperature
}

struct ForecastsViewModel: ForecastsViewModeling {
    var dates = [ForecastDate]()
    var forecastViewModels = [ForecastDate: [ForecastViewModel]]()
    
    struct Formatter {
        static let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter
        }()
    }
    
    init() {
        dates = [ForecastDate]()
        forecastViewModels = [ForecastDate: [ForecastViewModel]]()
    }
    
    init(forecasts model: Forecasts, city: String) {
        self.init()
        
        for forecastData in model.list {
            let forecastViewModel = ForecastViewModel(forecast: forecastData, city: city)
            if let forecastDate = forecastViewModel.forecastDate {
                let datePretty = Formatter.dateFormatter.string(from: forecastDate)
                
                add(forecastViewModel: forecastViewModel, date: datePretty)
            }
        }
    }
    
    init(csvString: String, separator: String, city: String) {
        self.init()
        
        // Saved information format:
        // date, time, temperature
        // eg. 2017-07-23, 09:00:00, 291.12
        let forecastEntries = csvString.components(separatedBy: CharacterSet.newlines)
        
        for forecast in forecastEntries {
            let forecastViewModel = ForecastViewModel(csvString: forecast, separator: separator, city: city)
            let forecastDetails = forecast.components(separatedBy: separator)
            if forecastDetails.count > ForecastsFileFields.date.rawValue {
                let forecastDate = forecastDetails[ForecastsFileFields.date.rawValue]
                add(forecastViewModel: forecastViewModel, date: forecastDate)
            }
        }
    }
    
    // MARK: - Internal methods
    
    func numberOfRows() -> Int {
        return dates.count
    }
    
    func numberOfCells(row: Int) -> Int {
        if let forecastDate = date(at: row) {
            return forecastViewModels[forecastDate]?.count ?? 0
        }
        
        return 0
    }
    
    func forecastViewModel(for indexPath: IndexPath) -> ForecastViewModel? {
        if let date = self.date(at: indexPath.section),
            let forecastsList = forecastViewModels[date],
            indexPath.row < forecastsList.count {
            
            return forecastsList[indexPath.row]
        }

        return nil
    }
    
    func date(at index: Int) -> ForecastDate? {
        guard index < dates.count else { return nil }
        
        return dates[index]
    }
    
    func csvSerializedString(separator: String) -> String {
        // Saved information format:
        // date, time, temperature
        // eg. 2017-07-23, 09:00:00, 291.12

        var serializedString = ""
        
        for date in dates {
            guard let forecastsGrouping = forecastViewModels[date] else { return "" }
            
            for forecastViewModel in forecastsGrouping {
                let forecastSerializedString = forecastViewModel.csvSerializedString(separator: separator)
                serializedString += date + separator + forecastSerializedString + "\n"
            }
        }
        
        return serializedString
    }
    
    // MARK: - Private methods
    
    fileprivate mutating func add(forecastViewModel: ForecastViewModel, date: ForecastDate) {
        var forecastsGrouping: [ForecastViewModel]
        
        if let forecasts = forecastViewModels[date] {
            forecastsGrouping = forecasts
        } else {
            dates.append(date)
            forecastsGrouping = [ForecastViewModel]()
        }
        
        forecastsGrouping.append(forecastViewModel)
        forecastViewModels[date] = forecastsGrouping
    }
}
