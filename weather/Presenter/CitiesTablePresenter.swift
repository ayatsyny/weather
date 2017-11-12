//
//  CitiesTablePresenter.swift
//  Weather App
//
//  Created by Vasyl Hrynchuk on 10/29/17.
//  Copyright © 2017 Vasyl Hrynchuk. All rights reserved.
//

import UIKit

struct CityDisplayItem {
    let name: String
    let temperature: Int
}


protocol CitiesListTableViewInterface: class {
    func show(cities: [CityDisplayItem])
    func show(city: CityDisplayItem, at index: Int)
    func reload(city: CityDisplayItem, at index: Int)
}

class CitiesTablePresenter {
    
    // MARK: Vars
    
    let model: CitiesList
    let view: CitiesListTableViewInterface
    fileprivate var list = [CityDisplayItem]()
    
    // MARK: Initialyzer
    
    init(with model: CitiesList, and view: CitiesListTableViewInterface) {
        self.model = model
        self.view = view
    }
    
    // MARK: Actions
    
    func didSelectItem(at index: Int) {
        view.show(city: list[index], at: index)
    }
    
    func loadData() {
        
        for c in model.allCities {
            let displayItem = CityDisplayItem(name: c.title,
                                              temperature: c.temperature)
            list.append(displayItem)
        }
        view.show(cities: list)
        
    }

}
