//
//  CityWeatherViewController.swift
//  Weather
//
//  Created by Dmytro Yurchenko on 21.1.21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit

class CityWeatherViewController: UIViewController {
     @IBOutlet weak var weatherImage: UIImageView!
     @IBOutlet weak var temperature: UILabel!
     @IBOutlet weak var city: UILabel!
     @IBOutlet weak var back: UIButton!
     
     @IBAction func returnBack(_ sender: UIButton) {
          self.dismiss(animated: true, completion: nil)
     }
     
     override func viewDidLoad() {
        super.viewDidLoad()
          back.layer.cornerRadius = back.frame.height / 5
          back.alpha = 0.33
    }

}

//MARK: - WeatherManagerDelegate
//extension CityWeatherViewController: WeatherManagerDelegate {
//     
//     func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
//          DispatchQueue.main.async {
//               self.temperature.text = weather.temperatureValue
//               self.weatherImage.image = UIImage(systemName: weather.weatherConditionName)
//               self.city.text = weather.city
//          }
//          
//     }
//     
//     func didFailWithError(_ error: Error) {
//          
//     }
//}
