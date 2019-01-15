//
//  Convenience.swift
//  codereview
//
//  Created by Noah Kim on 1/15/19.
//  Copyright © 2019 Noah Kim. All rights reserved.
//

import UIKit

func floatFromString(_ string: String) -> CGFloat? {
  guard let float = NumberFormatter().number(from: string.trimmingCharacters(in: .whitespaces)) else { return nil }
  return CGFloat(truncating: float)
}

struct Color {
  let red: CGFloat
  let green: CGFloat
  let blue: CGFloat
}

func colorFromString(_ css: String) -> Color? {
  let start = css.index(css.startIndex, offsetBy: 4)
  let end = css.index(css.endIndex, offsetBy: -1)
  let values = css[start..<end].split(separator: ",")
  guard let r = floatFromString(String(values[0])),
    let g = floatFromString(String(values[1])),
    let b = floatFromString(String(values[2]))
    else { return nil }
  return Color(red: r / 255, green: g / 255, blue: b / 255)
}

extension UIColor {
  convenience init(_ color: Color) {
    self.init(red: color.red, green: color.green, blue: color.blue, alpha: 1)
  }
}

struct Transition {
  
  static func Base() -> CATransition {
    let transition = CATransition()
    transition.duration = 0.45
    transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    return transition
  }
  
  static func MoveIn() -> CATransition {
    let transition = self.Base()
    transition.type = .moveIn
    transition.subtype = .fromRight
    return transition
  }
  
  static func Reveal() -> CATransition {
    let transition = self.Base()
    transition.type = .reveal
    transition.subtype = .fromLeft
    return transition
  }
  
}
