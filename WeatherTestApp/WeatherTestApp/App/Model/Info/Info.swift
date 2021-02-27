//
//  Info.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

struct Info: Codable, Hashable {
    // Широта (в градусах).
    let lat: Double?
    // Долгота (в градусах).
    let lon: Double?
    // Информация о часовом поясе. Содержит поля offset, name, abbr и dst.
    let tzinfo: TZInfo?
    // Норма давления для данной координаты (в мм рт. ст.).
    let def_pressure_mm: Int?
    // Норма давления для данной координаты (в гектопаскалях).
    let def_pressure_pa: Int?
    // Страница населенного пункта на сайте Яндекс.Погода.
    let url: String?
    
    let identifier: UUID? = UUID()
    static func == (lhs: Info, rhs: Info) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
