//
//  Fact.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

struct Fact: Codable, Hashable {
    let uptime: Int?
    let precProb: Int?
    let source: String?
    let accumPrec: AccumPrec?
    let soilMoisture: Double?
    let soilTemp: Int?
    let uvIndex: Int?
    let temp: Int
    let feels_like: Int?
    let windSpeed: Double?
    let windGust: Double?
    let windDir: String?
    let tempWater: Int?
    let icon: String?
    let condition: String
    let pressureMM: Int?
    let pressurePa: Int?
    let humidity: Int
    let daytime: String?
    let polar: Bool?
    let season: String?
    let obsTime: Int?
    let isThunder: Bool?
    let precType: Int?
    let precStrength: Int?
    let cloudness: Double?
    let phenomIcon: String?
    let phenomCondition: String?
    
    enum CodingKeyes: String, CodingKey {
        case temp
        case feels_like
        case tempWater = "temp_water"
        case icon
        case condition
        case windSpeed = "wind_speed"
        case windGust = "wind_gust"
        case windDir = "wind_dir"
        case pressureMM = "pressure_mm"
        case pressurePa = "pressure_pa"
        case humidity
        case daytime
        case polar
        case season
        case obsTime = "obs_time"
        case isThunder = "is_thunder"
        case precType = "prec_type"
        case precStrength = "prec_strength"
        case cloudness
        case phenomIcon = "phenom_icon"
        case phenomCondition = "phenom_condition"
        case uptime
        case precProb = "prec_prob"
        case source
        case accumPrec = "accum_prec"
        case soilMoisture = "soil_moisture"
        case soilTemp = "soil_temp"
        case uvIndex = "uv_index"
    }
    
    let identifier = UUID()
    static func == (lhs: Fact, rhs: Fact) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
