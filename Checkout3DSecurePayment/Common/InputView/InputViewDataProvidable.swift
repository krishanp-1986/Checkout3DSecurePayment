//
//  InputViewDataProvidable.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

protocol InputViewDataProvidable {
  var key: String { get }
  var placeHolder: String { get }
  var formatter: Formattable? { get set }
  var validator: Validator? { get set }
  var maxCharacterCount: Int? { get set }
  func isValid() -> (isValid: Bool, errorMessage: String?)
  func setValue(value: String?)
  func getValue() -> [String: String?]
}

class InputViewModel: InputViewDataProvidable {
  var maxCharacterCount: Int?
  var validator: Validator?
  var formatter: Formattable?
  let key: String
  let placeHolder: String
  private(set) var value: String?
  
  init(
    key: String = "",
    placeHolder: String = "",
    formatter: Formattable? = nil,
    validator: Validator? = nil
  ) {
    self.key = key
    self.placeHolder = placeHolder
    self.formatter = formatter
    self.validator = validator
  }
  
  func isValid() -> (isValid: Bool, errorMessage: String?) {
    self.validator?.isValid(self.value) ?? (isValid: true, errorMessage: nil)
  }
  
  func setValue(value: String?) {
    self.value = value
  }
  
  func getValue() -> [String: String?] {
    [key: value]
  }
}
