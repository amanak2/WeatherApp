//
//  Location.swift
//  WeatherApp
//
//  Created by Aman Chawla on 28/03/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import CoreLocation

class Location {
	
	static var sharedInstance = Location()
	
	private init() { }
	
	var latitude: Double!
	var longitude: Double! 
	
}
