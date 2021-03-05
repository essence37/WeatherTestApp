//
//  UIView+Extensions.swift
//  WeatherTestApp
//
//  Created by Пазин Даниил on 05.03.2021.
//

import UIKit

public extension UIView {
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }
}
