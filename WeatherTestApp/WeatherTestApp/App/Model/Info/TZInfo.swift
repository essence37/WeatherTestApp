//
//  TZInfo.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 24.02.2021.
//

import Foundation

struct TZInfo: Codable, Hashable {
    // Название часового пояса.
    let name: String?
    // Сокращенное название часового пояса.
    let abbr: String?
    // Признак летнего времени.
    let dst: Bool?
    // Часовой пояс в секундах от UTC.
    let offset: Int?
    
    let identifier: UUID? = UUID()
    static func == (lhs: TZInfo, rhs: TZInfo) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
