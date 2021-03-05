//
//  DetailViewController.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 26.02.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var detailView: DetailView = {
        let view = DetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(detailView)
        detailView.setupConstraints(self.view)
        configureLabels()
    }
    
    func configureLabels() {guard let weather = weather else { return }
        detailView.cityNameLabel.text = "Погода в городе \(weather.geo_object.locality.name)"
        let temperature = weather.fact.temp
        detailView.temperatureLabel.text = temperature > 0 ? "+\(temperature)°C" : "\(temperature)°C"
        detailView.conditionLabel.text = "\(weather.fact.condition)"
        detailView.humidityLabel.text = "Влажность: \(weather.fact.humidity)%"
        guard let feelsLike = weather.fact.feels_like else { return }
        detailView.feelsLikeLabel.text = feelsLike > 0 ? "Ощущается как +\(temperature)°C" : "Ощущается как \(temperature)°C"
    }
}
