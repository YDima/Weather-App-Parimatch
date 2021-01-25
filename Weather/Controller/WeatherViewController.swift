import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
     
     @IBOutlet weak var search: UITextField!
     var weatherManager = WeatherManager()
     @IBOutlet weak var cityCollection: UICollectionView!
     
     let reuseIdentifier = "City"
     var cities = ["Kyiv", "Dnipro"]
     var cityName: String?
     var temperature: String?

     override func viewDidLoad() {
          super.viewDidLoad()
          search.delegate = self
     }
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
     
     @IBAction func searchPressed(_ sender: UIButton) {
          search.endEditing(true)
     }
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          search.endEditing(true)
          return true
     }
     
     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
          if textField.text != "" {
               return true
          } else {
               textField.placeholder = "Write the name of the location"
               return false
          }
     }
     
     func textFieldDidEndEditing(_ textField: UITextField) {
          if let city = search.text {
               if cities.contains(city) {
                    search.text = ""
                    textField.placeholder = "City already added"
                    return
               }
               cities.append(city)
               
               let indexPath = IndexPath(item: cities.count - 1, section: 0)
               cityCollection.insertItems(at: [indexPath])
          }
          search.text = ""
          textField.placeholder = "Search"
     }
}

//MARK: - UICollectionView

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
     
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return self.cities.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let city = self.cities[indexPath.item]
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CityCollectionViewCell
          
          weatherManager.delegate = cell
          weatherManager.fetchWeather(cityName: city)

          cell.layer.cornerRadius = cell.frame.height / 5
          
          return cell
     }
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          self.performSegue(withIdentifier: "showCityWeather", sender: self)
     }
     
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//          if segue.identifier == "showCityWeather" {
//               let destinationVC = segue.destination as! CityWeatherViewController
//               
//          }
//     }
}

