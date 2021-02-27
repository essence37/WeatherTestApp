//
//  DetailViewController.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 26.02.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabels()
    }
    
    func configureLabels() {
        guard let weather = weather else { return }
        cityNameLabel.text = "Погода в городе \(weather.geo_object.locality.name)"
        let temperature = weather.fact.temp
        temperatureLabel.text = temperature > 0 ? "+\(temperature)°C" : "\(temperature)°C"
        conditionLabel.text = "\(weather.fact.condition)"
        humidityLabel.text = "Влажность: \(weather.fact.humidity)%"
        guard let feelsLike = weather.fact.feelsLike else { return }
        feelsLikeLabel.text = feelsLike > 0 ? "Ощущается как +\(temperature)°C" : "Ощущается как \(temperature)°C"
    }
}
