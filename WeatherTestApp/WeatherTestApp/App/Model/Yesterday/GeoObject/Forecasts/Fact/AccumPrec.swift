//
//  AccumPrec.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 25.02.2021.
//

import Foundation

struct AccumPrec: Codable, Hashable {
    let one: Double?
    let three: Double?
    let seven: Double?
    
    enum CodingKeyes: String, CodingKey {
        case one = "1"
        case three = "3"
        case seven = "7"
    }
    
    let identifier = UUID()
    static func == (lhs: AccumPrec, rhs: AccumPrec) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
