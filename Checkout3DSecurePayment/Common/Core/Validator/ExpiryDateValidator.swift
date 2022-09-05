//
//  ExpiryDateValidator.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

struct ExpiryDateValidator: Validator {
  func isValid(_ input: String?) -> (isValid: Bool, errorMessage: String?) {
    guard let userInput = input else { return (isValid: false, errorMessage: L10n.emptyExpiryDateError) }
    
    guard let date = userInput.creditCardExpiryDate, userInput.count == 6 else {
      return (isValid: false, errorMessage: L10n.invalidExpiryDateFormatError)
    }
    
    guard let endOfMonth = date.endOfMonth(), endOfMonth.isGreaterOrEqual(date: Date()) else {
      return (isValid: false, errorMessage: L10n.pastExpiryDateFormatError)
    }
    
    return (isValid: true, errorMessage: nil)
  }
}
