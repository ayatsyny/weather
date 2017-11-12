//
//  CityTableViewCell.swift
//  Weather App
//
//  Created by Vasyl Hrynchuk on 10/29/17.
//  Copyright © 2017 Vasyl Hrynchuk. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    // MARK: Vars
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    // MARK: Action
    
    func setupWith(name: String, temperature: Int) {
        titleLabel.text = name
        temperatureLabel.text = "\(temperature)°"
    }
}
