//
//  constents.swift
//  WeatherApp
//
//  Created by Aman Chawla on 21/03/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import Foundation

let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
let baseUrl2 = "http://api.openweathermap.org/data/2.5/forecast?"
let latitude = "lat="
let longitude = "&lon="
let appId = "&appid="
let appKey = "5077e61e3beffb48dcc1e98c499e3b9e"

let currentWeatherUrl = "\(baseUrl)\(latitude)35\(longitude)139\(appId)\(appKey)"
let currentForecastUrl = "\(baseUrl2)\(latitude)35\(longitude)139\(appId)\(appKey)"

typealias downloadComplete = () -> ()

