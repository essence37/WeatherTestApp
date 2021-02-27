//
//  TimeOfDay.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

struct TimeOfDay: Codable, Hashable {
    let _source: String?
    let temp_min: Int?
    let temp_max: Int?
    let temp_avg: Int?
    let feels_like: Int?
    let icon: String?
    let condition: String?
    let daytime: String?
    let polar: Bool?
    let wind_speed: Double?
    let wind_gust: Double?
    let wind_dir: String?
    let pressure_mm: Double?
    let pressure_pa: Double?
    let humidity: Double?
    let prec_mm: Double?
    let prec_period: Double?
    let prec_type: Double?
    let prec_strength: Double?
    let cloudness: Double?
    let soil_temp: Int?
    let soil_moisture: Double?
    let prec_prob: Int?
    let uv_index: Int?
    
    let identifier: UUID? = UUID()
    static func == (lhs: TimeOfDay, rhs: TimeOfDay) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
