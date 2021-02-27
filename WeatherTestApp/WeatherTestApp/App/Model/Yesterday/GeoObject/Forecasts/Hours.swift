//
//  Hours.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 25.02.2021.
//

import Foundation

struct Hours: Codable, Hashable {
    let hour: String?
    let hour_ts: Int?
    let temp: Int?
    let feels_like: Int?
    let icon: String?
    let condition: String?
    let wind_speed: Double?
    let wind_gust: Double?
    let wind_dir: String?
    let pressure_mm: Int?
    let pressure_pa: Int?
    let humidity: Int?
    let prec_mm: Double?
    let prec_period: Int?
    let prec_type: Int?
    let prec_strength: Double?
    let is_thunder: Bool?
    let cloudness: Double?
    
    let identifier: UUID? = UUID()
    static func == (lhs: Hours, rhs: Hours) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
