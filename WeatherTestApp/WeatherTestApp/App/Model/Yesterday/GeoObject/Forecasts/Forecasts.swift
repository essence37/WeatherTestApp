//
//  Forecasts.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

struct Forecasts: Codable, Hashable {
    let date: String?
    let dateTs: Int?
    let week: Int?
    let sunrise: String?
    let sunset: String?
    let moonCode: Int?
    let moonText: String?
    let parts: Parts?
    let hours: [Hours?]?
    let riseBegin: String?
    let setEnd: String?
    let biomet: Biomet?
    
    enum CodingKeyes: String, CodingKey {
        case date
        case dateTs = "date_ts"
        case week
        case sunrise
        case sunset
        case moonCode = "moon_code"
        case moonText = "moon_text"
        case parts
        case hours
        case riseBegin = "rise_begin"
        case setEnd = "set_end"
        case biomet
    }
    
    let identifier = UUID()
    static func == (lhs: Forecasts, rhs: Forecasts) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
