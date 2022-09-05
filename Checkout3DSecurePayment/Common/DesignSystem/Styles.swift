//
//  Styles.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation
import UIKit

public typealias Style<Component> = (Component) -> Void

public extension DesignSystem {
  struct Styles {
    public lazy var button: Style<Button> = { button in
      button.layer.borderColor = DesignSystem.shared.colors.inputBorder.cgColor
      button.layer.borderWidth = 1
      button.layer.cornerRadius = CGFloat(DesignSystem.shared.sizer.sm)
    }
    
    public lazy var textInput: Style<TextInput> = { textInput in
      textInput.layer.borderColor = DesignSystem.shared.colors.inputBorder.cgColor
      textInput.layer.borderWidth = 1
      textInput.layer.cornerRadius = CGFloat(DesignSystem.shared.sizer.sm)
    }
    
    public lazy var headerLabel: Style<UILabel> = { label in
      label.numberOfLines = 0
      label.textColor = DesignSystem.shared.colors.textDefault
    }
    
    public lazy var titleLabel: Style<UILabel> = { label in
      label.numberOfLines = 0
      label.textColor = DesignSystem.shared.colors.textDefault
      label.font = DesignSystem.shared.fonts.headerTitle
    }
  }
}
