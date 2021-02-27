//
//  Parts.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

struct Parts: Codable, Hashable {
    let night: TimeOfDay?
    let morning: TimeOfDay?
    let day: TimeOfDay?
    let evening: TimeOfDay?
    let day_short: TimeOfDayShort?
    let night_short: TimeOfDayShort?
    
    let identifier: UUID? = UUID()
    static func == (lhs: Parts, rhs: Parts) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
