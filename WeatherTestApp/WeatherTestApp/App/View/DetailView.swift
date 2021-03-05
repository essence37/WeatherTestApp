//
//  DetailView.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 04.03.2021.
//

import UIKit

final class DetailView: UIView {
    
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 80)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupSubviewsConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubviews(cityNameLabel, temperatureLabel, humidityLabel, conditionLabel, feelsLikeLabel)
    }
    
    private func setupSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            cityNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            cityNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 60),
            temperatureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            conditionLabel.topAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: 10),
            conditionLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 10),
            conditionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            humidityLabel.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 10),
            humidityLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            feelsLikeLabel.bottomAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -10),
            feelsLikeLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -10),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 10),
        ])
    }
    
    func setupConstraints(_ superview: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
}
