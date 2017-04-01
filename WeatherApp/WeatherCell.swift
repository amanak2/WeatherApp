//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Aman Chawla on 28/03/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

	@IBOutlet weak var weatherIcon: UIImageView!
	@IBOutlet weak var dayLbl: UILabel!
	@IBOutlet weak var weatherTypeLbl: UILabel!
	@IBOutlet weak var highTempLbl: UILabel!
	@IBOutlet weak var lowTempLbl: UILabel!

	func configureCell(forecast: Forecast) {
		lowTempLbl.text = "\(forecast.lowTemp)"
		highTempLbl.text = "\(forecast.highTemp)"
		weatherTypeLbl.text = forecast.weatherType
		dayLbl.text = forecast.date
		weatherIcon.image = UIImage(named: forecast.weatherType)
		
	}

}
