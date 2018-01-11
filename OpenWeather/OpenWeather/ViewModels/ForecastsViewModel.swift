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
    static func forecastsViewModel(forecasts: Forecasts, city: String) -> ForecastsViewModeling
    static func forecastsViewModel(csvString: String, separator: String, city: String) -> ForecastsViewModeling
    func numberOfRows() -> Int
    func numberOfCells(row: Int) -> Int
    func forecastViewModel(for indexPath: IndexPath) -> ForecastViewModeling?
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
    var forecastViewModels = [ForecastDate: [ForecastViewModeling]]()
    
    struct Formatter {
        static let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter
        }()
    }
    
    init() {
        dates = [ForecastDate]()
        forecastViewModels = [ForecastDate: [ForecastViewModeling]]()
    }
    
    static func forecastsViewModel(forecasts: Forecasts, city: String) -> ForecastsViewModeling {
        var forecastsViewModel = ForecastsViewModel()
        
        for forecastData in forecasts.list {
            let forecastViewModel = ForecastViewModel.forecastViewModel(forecast: forecastData, city: city)
            if let forecastDate = forecastViewModel.forecastDate {
                let datePretty = Formatter.dateFormatter.string(from: forecastDate)
                
                forecastsViewModel.add(forecastViewModel: forecastViewModel, date: datePretty)
            }
        }
        
        return forecastsViewModel
    }
    
    static func forecastsViewModel(csvString: String, separator: String, city: String) -> ForecastsViewModeling {
        var forecastsViewModel = ForecastsViewModel()
        
        // Saved information format:
        // date, time, temperature
        // eg. 2017-07-23, 09:00:00, 291.12
        let forecastEntries = csvString.components(separatedBy: CharacterSet.newlines)
        
        for forecast in forecastEntries {
            let forecastDetails = forecast.components(separatedBy: separator)
            if forecastDetails.count > ForecastsFileFields.date.rawValue {
                let forecastDateString = forecastDetails[ForecastsFileFields.date.rawValue]
                guard let forecastDate = Formatter.dateFormatter.date(from: forecastDateString) else {
                    continue
                }
                
                var forecastViewModel = ForecastViewModel.forecastViewModel(csvString: forecast, separator: separator, city: city)
                
                forecastViewModel.forecastDate = forecastDate
                forecastsViewModel.add(forecastViewModel: forecastViewModel, date: forecastDateString)
            }
        }
        
        return forecastsViewModel
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
    
    func forecastViewModel(for indexPath: IndexPath) -> ForecastViewModeling? {
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
    
    fileprivate mutating func add(forecastViewModel: ForecastViewModeling, date: ForecastDate) {
        guard !date.isEmpty else { return }
        
        var forecastsGrouping: [ForecastViewModeling]
        
        if let forecasts = forecastViewModels[date] {
            forecastsGrouping = forecasts
        } else {
            dates.append(date)
            forecastsGrouping = [ForecastViewModeling]()
        }
        
        forecastsGrouping.append(forecastViewModel)
        forecastViewModels[date] = forecastsGrouping
    }
}
