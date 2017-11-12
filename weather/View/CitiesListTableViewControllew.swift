//
//  CitiesListTableViewControllew.swift
//  Weather App
//
//  Created by Vasyl Hrynchuk on 10/29/17.
//  Copyright © 2017 Vasyl Hrynchuk. All rights reserved.
//

import UIKit

class CitiesListTableViewControllew: UITableViewController {

    // MARK: Vars
    
    var presenter: CitiesTablePresenter!
    let cellIdentifier = "cell"
    fileprivate var isDataLoaded = false
    fileprivate var displayItems = [CityDisplayItem]()
    
    // MARK: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = CitiesTablePresenter(with: CitiesList(),
                                         and: self)
        
//        let nib = UINib(nibName: "CityTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !isDataLoaded {
            isDataLoaded = true
            presenter.loadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityTableViewCell {
            let city = displayItems[indexPath.row]
            cell.setupWith(name: city.name,
                           temperature: city.temperature)
            return cell
        }
        fatalError()
    }

}

extension CitiesListTableViewControllew: CitiesListTableViewInterface {
    func show(cities: [CityDisplayItem]) {
        displayItems = cities
        tableView.reloadData()
    }
    
    func show(city: CityDisplayItem, at index: Int) {
        print("Show city \(city.name)")
    }
    
    func reload(city: CityDisplayItem, at index: Int) {
        print("Reload city \(city.name)")
    }
    
}
