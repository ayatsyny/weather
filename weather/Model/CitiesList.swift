//
//  CitiesList.swift
//  Weather App
//
//  Created by Vasyl Hrynchuk on 10/29/17.
//  Copyright © 2017 Vasyl Hrynchuk. All rights reserved.
//

import UIKit

class CitiesList {
    
    // MARK: Definitions
    
    struct City {
        let title: String
        var lastUpdateTime: NSDate
        var temperature: Int
    }
    
    // MARK: Vars
    
    fileprivate var cities = [City]()
    
    var allCities: [City] {
        var list = [City]()
        for index in 0..<numberOfItems() {
            list.append(item(at: index))
        }
        return list
    }
    
    // MARK: Initializer
    
    // This init is made for test purpose. Rewrite it later.
    init() {
        let list = ["Lviv", "Kyiv"]
        for item in list{
            cities.append(.init(title: item, lastUpdateTime: NSDate(), temperature: 19))
        }
    }
    
    // MARK: Actions
    
    func numberOfItems() -> Int {
        return cities.count
    }
    
    func item(at index: Int) -> City {
        return cities[index]
    }

}
