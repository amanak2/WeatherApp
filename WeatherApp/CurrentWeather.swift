//
//  currentWeather.swift
//  WeatherApp
//
//  Created by Aman Chawla on 21/03/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
	
	var _cityName: String!
	var _date: String!
	var _weatherType: String!
	var _currentTemp: Double!
	
	var cityName: String {
		if _cityName == nil {
			_cityName = "Err"
		}
		return _cityName
	}
	
	var date: String {
		if _date == nil {
			_date = "Err"
		}
		let dateFormater = DateFormatter()
		dateFormater.dateStyle = .medium
		dateFormater.timeStyle = .none
		
		let currentDate = dateFormater.string(from: Date())
		self._date = "Today, \(currentDate)"
		
		return _date
	}
	
	var weatherType: String {
		if _weatherType == nil {
			_weatherType = "Err"
		}
		return _weatherType
	}
	
	var currentTemp: Double {
		if _currentTemp == nil {
			_currentTemp = 0.0
		}
		return _currentTemp
	}
	
	func downloadWeatherData(completed: @escaping downloadComplete) {
		Alamofire.request(currentWeatherUrl).responseJSON { response in
			
			if let dict = response.result.value as? Dictionary<String, AnyObject> {
				
				if let name = dict["name"] as? String {
					self._cityName = name.capitalized
				}
				
				if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
					if let main = weather[0]["main"] as? String {
						self._weatherType = main.capitalized
					}
				}
				
				if let main = dict["main"] as? Dictionary<String, AnyObject> {
					if let temp = main["temp"] as? Double {
						let KelvineToCelcies = (temp - 273.15)
						self._currentTemp = round(KelvineToCelcies)
					}
				}
				
			}
			completed()
		}
	}

}
