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
  func isValid() -> Bool
  func setValue(_ value: String?)
  func getValue() -> [String: String?]
}

class InputViewModel: InputViewDataProvidable {
  let key: String
  let placeHolder: String
  private var value: String?
  
  init(key: String = "", placeHolder: String = "") {
    self.key = key
    self.placeHolder = placeHolder
  }
  
  func isValid() -> Bool {
    !(self.value?.isEmpty ?? true)
  }
  
  func setValue(_ value: String?) {
    self.value = value
  }
  
  func getValue() -> [String: String?] {
    [key: value]
  }
}
