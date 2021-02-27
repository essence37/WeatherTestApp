//
//  Yesterday.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 25.02.2021.
//

import Foundation

struct Yesterday: Codable, Hashable {
    let temp: Int?
    
    let identifier: UUID? = UUID()
    static func == (lhs: Yesterday, rhs: Yesterday) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
