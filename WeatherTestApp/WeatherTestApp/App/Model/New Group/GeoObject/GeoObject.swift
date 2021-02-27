//
//  GeoObject.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 25.02.2021.
//

import Foundation

struct GeoObject: Codable, Hashable {
    let district: GeoObjectSub?
    let locality: GeoObjectSub
    let province: GeoObjectSub?
    let country: GeoObjectSub?
    
    let identifier: UUID? = UUID()
    static func == (lhs: GeoObject, rhs: GeoObject) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
