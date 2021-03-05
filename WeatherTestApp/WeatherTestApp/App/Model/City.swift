//
//  City.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

struct City {
    let name: String
    let lat: String
    let lon: String
    
    static func cities() -> [City] {
        return [
            City(name: "Moscow", lat: "55.75396", lon: "37.620393"),
            City(name: "Краснодар", lat: "45.055251", lon: "38.999233"),
            City(name: "Санкт-Петербург", lat: "59.946307", lon: "30.354208"),
            City(name: "Абакан", lat: "53.712975", lon: "91.424559"),
            City(name: "Владикавказ", lat: "43.044293", lon: "44.670981"),
            City(name: "Ялта", lat: "44.498960", lon: "34.155582"),
            City(name: "Анапа", lat: "44.888242", lon: "37.324353"),
            City(name: "Норильск", lat: "69.349778", lon: "88.186015"),
            City(name: "Якутск", lat: "62.049291", lon: "129.719635"),
            City(name: "Иваново", lat: "57.001557", lon: "40.965267")
        ]
    }
}
