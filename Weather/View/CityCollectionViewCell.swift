//
//  CityCollectionViewCell.swift
//  Weather
//
//  Created by Dmytro Yurchenko on 21.1.21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
     @IBOutlet weak var cityName: UILabel!
     @IBOutlet weak var cityTemperature: UILabel!
}

extension CityCollectionViewCell: WeatherManagerDelegate {

     func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
          DispatchQueue.main.async {
               self.cityTemperature.text = "\(weather.temperatureValue)°"
               self.cityName.text = weather.city
          }
     }

     func didFailWithError(_ error: Error) {

     }
}
