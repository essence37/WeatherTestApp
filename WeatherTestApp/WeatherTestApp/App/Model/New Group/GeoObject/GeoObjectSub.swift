//
//  GeoObjectSub.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 25.02.2021.
//

import Foundation

struct GeoObjectSub: Codable, Hashable {
    let id: Int?
    let name: String
    
    let identifier: UUID? = UUID()
    static func == (lhs: GeoObjectSub, rhs: GeoObjectSub) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
