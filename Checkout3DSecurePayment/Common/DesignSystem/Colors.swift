//
//  Colors.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation
import UIKit

extension DesignSystem {
  public struct Colors {
    public let primary = UIColor(light: .init(hex: "0079C9"), dark: .init(hex: "00AAED"))
    public let error = UIColor(light: .init(hex: "D32F2F"), dark: .init(hex: "FF6A61"))
    public let inputBorder = UIColor(light: .init(hex: "C5C5C5"), dark: .init(hex: "616161"))
    
    // MARK: - Texts
    public let textDefault = UIColor(light: .init(hex: "000000"), dark: .init(hex: "000000"))
    
    // Background
    public let backgroundPrimary = UIColor(light: .init(hex: "FFFFFF"), dark: .init(hex: "FFFFFF"))
  }
}

public extension UIColor {
  /// Return `UIColor` used in light mode.
  var light: UIColor {
    resolvedColor(with: .init(userInterfaceStyle: .light))
  }
  
  /// Return `UIColor` used in dark mode.
  var dark: UIColor {
    resolvedColor(with: .init(userInterfaceStyle: .dark))
  }
  
  /// Initialize a `UIColor` from a light and dark colors pair.
  /// - Parameters:
  ///   - light: color to be used in light mode.
  ///   - dark: color to be used in dark mode.
  convenience init(light: UIColor, dark: UIColor) {
    self.init { traits in
      switch traits.userInterfaceStyle {
      case .dark:
        return dark
      default:
        return light
      }
    }
  }
  
  /// Initialize a `UIColor` from a hex string.
  /// - Parameters:
  ///   - her: hex string.
  ///
  /// reference : https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor
  convenience init(hex: String) {
    var hexColor = hex
    let red, green, blue, alpha: CGFloat
    
    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      hexColor = String(hex[start...])
    }
    
    let scanner = Scanner(string: hexColor)
    var hexNumber: UInt64 = 0
    
    guard scanner.scanHexInt64(&hexNumber) else { // Make sure the strinng is a hex code.
      self.init(white: 0, alpha: 0)
      return
    }
    switch hexColor.count {
    case 3, 4: // Color is in short hex format
      var updatedHexString = ""
      hexColor.forEach { updatedHexString.append(String(repeating: String($0), count: 2)) }
      hexColor = updatedHexString
      self.init(hex: hexColor)
      
    case 6: // Color is in hex format without alpha.
      red = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
      green = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
      blue = CGFloat(hexNumber & 0x0000FF) / 255.0
      alpha = 1.0
      self.init(red: red, green: green, blue: blue, alpha: alpha)
      
    case 8: // Color is in hex format with alpha.
      red = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
      green = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
      blue = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
      alpha = CGFloat(hexNumber & 0x000000FF) / 255.0
      self.init(red: red, green: green, blue: blue, alpha: alpha)
      
    default: // Invalid format.
      self.init(white: 0, alpha: 0)
    }
  }
}
