//
//  ViewController.swift
//  WeatherApp
//
//  Created by Aman Chawla on 21/03/17.
//  Copyright © 2017 Aman Chawla. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate {
	
	@IBOutlet weak var dateLbl: UILabel!
	@IBOutlet weak var locationLbl: UILabel!
	@IBOutlet weak var currentTempLbl: UILabel!
	@IBOutlet weak var weatherImg: UIImageView!
	@IBOutlet weak var currentWeatherLbl: UILabel!
	@IBOutlet weak var tableView: UITableView!
	
	let locationManager = CLLocationManager()
	var currentLocation: CLLocation!
	
	var currentWeather: CurrentWeather!
	var forecast: Forecast!
	var forecasts = [Forecast]()

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestWhenInUseAuthorization()
		locationManager.startMonitoringSignificantLocationChanges()
		
		currentWeather = CurrentWeather()
		
		currentWeather.downloadWeatherData() {
			self.downloadForcastData {
				self.updateMainUI()
			}
		}
		
	}
	
	func locationAuthStatus() {
		if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
			currentLocation = locationManager.location
			Location.sharedInstance.latitude = currentLocation.coordinate.latitude
			Location.sharedInstance.longitude = currentLocation.coordinate.longitude
			
		} else {
			locationManager.requestAlwaysAuthorization()
			locationAuthStatus()
			
		}
		
	}
	
	func downloadForcastData(completed: @escaping downloadComplete) {
		Alamofire.request(currentForecastUrl).responseJSON { responds in
			if let dict = responds.result.value as? Dictionary<String, AnyObject> {
				if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
					for obj in list {
						let forecast = Forecast(weatherDict: obj)
						self.forecasts.append(forecast)
					}
					self.forecasts.remove(at: 0)
					self.tableView.reloadData()
				}
			}
			completed()
		}
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return forecasts.count
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
			let forecast = forecasts[indexPath.row]
			cell.configureCell(forecast: forecast)
			return cell
		} else {
			return WeatherCell()
		}
	}
	
	func updateMainUI() {
		dateLbl.text = currentWeather.date
		currentTempLbl.text = "\(currentWeather.currentTemp)"
		currentWeatherLbl.text = currentWeather.weatherType
		locationLbl.text = currentWeather.cityName
		weatherImg.image = UIImage(named: currentWeather.weatherType)
		
	}

}

