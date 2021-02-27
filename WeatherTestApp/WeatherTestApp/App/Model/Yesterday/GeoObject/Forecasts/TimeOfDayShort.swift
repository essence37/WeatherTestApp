//
//  TimeOfDayShort.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 25.02.2021.
//

import Foundation

struct TimeOfDayShort: Codable, Hashable {
    let _source: String?
    let temp: Int?
    let temp_min: Int?
    let temp_max: Int?
    let feels_like: Int?
    let icon: String?
    let condition: String?
    let wind_speed: Double?
    let wind_gust: Double?
    let wind_dir: String?
    let pressure_mm: Double?
    let pressure_pa: Double?
    let humidity: Double?
    let prec_type: Double?
    let prec_strength: Double?
    let cloudness: Double?
    let soil_temp: Int?
    let soil_moisture: Double?
    let prec_mm: Double?
    let prec_prob: Int?
    let prec_period: Int?
    let uv_index: Int?
    let daytime: String?
    let polar: Bool?
    
    let identifier: UUID? = UUID()
    static func == (lhs: TimeOfDayShort, rhs: TimeOfDayShort) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
