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
    
    init(forecasts model: Forecasts, city: String) {
        dates = [ForecastDate]()
        forecastViewModels = [ForecastDate: [ForecastViewModel]]()
        
        for forecastData in model.list {
            let forecastViewModel = ForecastViewModel(forecast: forecastData, city: city)
            if let forecastDate = forecastViewModel.forecastDate {
                let datePretty = Formatter.dateFormatter.string(from: forecastDate)
                
                add(forecastViewModel: forecastViewModel, date: datePretty)
            }
        }
    }
    
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
