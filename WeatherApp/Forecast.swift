//
//  Forcast.swift
//  WeatherApp
//
//  Created by Aman Chawla on 22/03/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
	var _date: String!
	var _weatherType: String!
	var _highTemp: Double!
	var _lowTemp: Double!
	
	var date: String {
		if _date == nil {
			_date = "Err"
		}
		return _date
	}
	
	var weatherType: String {
		if _weatherType == nil {
			_weatherType = "Err"
		}
		return _weatherType
	}
	
	var highTemp: Double {
		if _highTemp == nil {
			_highTemp = 0.0
		}
		return _highTemp
	}
	
	var lowTemp: Double {
		if _lowTemp == nil {
			_lowTemp = 0.0
		}
		return _lowTemp
	}
	
	init(weatherDict: Dictionary<String, AnyObject>) {
		
		if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
			
			if let min = temp["min"] as? Double {
				let KelvineToCelcies = (min - 273.15)
				self._lowTemp = round(KelvineToCelcies)
			}
			
			if let max = temp["max"] as? Double {
				let KelvineToCelcies = (max - 273.15)
				self._highTemp = round(KelvineToCelcies)
			}
		}
		
		if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
			if let main = weather[0]["main"] as? String {
				self._weatherType = main
			}
			
		}
		
		if let date = weatherDict["dt"] as? Double {
			let unixConvertedDate = Date(timeIntervalSince1970: date)
			let dateFormatter = DateFormatter()
			dateFormatter.dateStyle = .full
			dateFormatter.timeStyle = .none
			dateFormatter.dateFormat = "EEEE"
			self._date = unixConvertedDate.dayOfTheWeek()
		}
	}
}

extension Date {
	func dayOfTheWeek() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "EEEE"
		return dateFormatter.string(from: self)
	}
}
