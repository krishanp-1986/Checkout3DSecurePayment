//
//  DesignSystem.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

public class DesignSystem {
  static let shared = DesignSystem()
  private init() {
    self.colors = .init()
    self.fonts = .init()
    self.styles = .init()
    self.sizer = .init()
  }
  
  public let colors: DesignSystem.Colors
  public let fonts: DesignSystem.Fonts
  public var styles: DesignSystem.Styles
  public let sizer: DesignSystem.Sizers
}
