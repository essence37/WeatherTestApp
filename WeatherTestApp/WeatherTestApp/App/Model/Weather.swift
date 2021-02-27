//
//  Weather.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

struct Weather: Codable, Hashable {
    let now: Int?
    let nowDT: String?
    let info: Info?
    let fact: Fact
    let forecasts: [Forecasts]?
    let geo_object: GeoObject
    let yesterday: Yesterday?
    
    enum CodingKeyes: String, CodingKey {
        case now
        case nowDT = "now_dt"
        case info
        case fact
        case forecasts
        case geo_object
        case yesterday
    }
    
    let identifier = UUID()
    static func == (lhs: Weather, rhs: Weather) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
