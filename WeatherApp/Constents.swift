//
//  constents.swift
//  WeatherApp
//
//  Created by Aman Chawla on 21/03/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import Foundation

let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
let baseUrl2 = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let latitude = "lat="
let longitude = "&lon="
let count = "&cnt=10"
let appId = "&appid="
let appKey = "5077e61e3beffb48dcc1e98c499e3b9e"

let lat = Location.sharedInstance.latitude!
let long = Location.sharedInstance.longitude!

let currentWeatherUrl = "\(baseUrl)\(latitude)\(lat)\(longitude)\(long)\(appId)\(appKey)"
let currentForecastUrl = "\(baseUrl2)\(latitude)\(lat)\(longitude)\(long)\(count)\(appId)\(appKey)"

typealias downloadComplete = () -> ()

