//
//  APIClient.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation
import Combine

struct APIClient {
    private let queue = DispatchQueue(label: "APIClient", qos: .default, attributes: .concurrent)
    
    func weather(city: City) -> AnyPublisher<Weather, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: Method.weather(city).request)
            .receive(on: queue)
            .map(\.data)
            .decode(type: Weather.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
