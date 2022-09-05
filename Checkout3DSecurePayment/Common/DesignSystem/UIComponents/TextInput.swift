//
//  TextInput.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import UIKit

public final class TextInput: UITextField {
  private var isLayoutSubViewCalled = false
  var textPadding = UIEdgeInsets(
    top: 0,
    left: 20,
    bottom: 0,
    right: 20
  )
  
  public override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  
  public override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  public override func layoutSubviews() {
    super.layoutSubviews()
    if !self.isLayoutSubViewCalled {
      self.isLayoutSubViewCalled = true
      DesignSystem.shared.styles.textInput(self)
    }
  }
  
  func setToNormalState() {
    self.layer.borderColor = DesignSystem.shared.colors.inputBorder.cgColor
  }
  
  func setToErrorState() {
    self.layer.borderColor = DesignSystem.shared.colors.error.cgColor
  }
}
