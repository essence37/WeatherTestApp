//
//  Method.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

// Перечисление методов API.
enum Method {
    
    static let apiKey = "5c2e5244-ed83-47f1-bba8-9e2623391070"
    
    case weather(City)
    
    // Вычисляемое свойство, возвращающее полный URL для каждого метода.
    var request: URLRequest {
        switch self {
        case .weather(let city):
            var components = URLComponents(string: "https://api.weather.yandex.ru/v2/forecast")
            let queryItemLat = URLQueryItem(name: "lat", value: city.lat)
            let queryItemLon = URLQueryItem(name: "lon", value: city.lon)
            components?.queryItems = [queryItemLon, queryItemLat]
            var request = URLRequest(url: (components?.url)!)
            request.addValue(Method.apiKey, forHTTPHeaderField: "X-Yandex-API-Key")
            return request
        }
    }
}

