//
//  Biomet.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 25.02.2021.
//

import Foundation

struct Biomet: Codable, Hashable {
    let index: Int?
    let condition: String?
    
    let identifier: UUID? = UUID()
    static func == (lhs: Biomet, rhs: Biomet) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
