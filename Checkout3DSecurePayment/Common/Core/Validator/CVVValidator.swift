//
//  CVVValidator.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

final class CVVValidator: Validator {
  private var cvvLength: Int = 3
  func isValid(_ input: String?) -> (isValid: Bool, errorMessage: String?) {
    guard let userInput = input, !userInput.isEmpty else {
      return (isValid: false, errorMessage: L10n.emptyCvvError)
    }
    if userInput.count == cvvLength {
      return (isValid: true, errorMessage: nil)
    }
    return (isValid: false, errorMessage: L10n.invalidCVVLengthError)
  }
  
  func setCvvLength(_ length: Int) {
    self.cvvLength = length
  }
}
