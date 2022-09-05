//
//  CreditCardValidator.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

final class CreditCardValidator: Validator {
  private(set) var validCardNumberLength = IndexSet([16])
  
  func isValid(_ input: String?) -> (isValid: Bool, errorMessage: String?) {
    guard let userInput = input else { return (isValid: false, errorMessage: L10n.emptyCreditCardNumberError) }
    
    guard validCardNumberLength.contains(userInput.count) else {
      return (isValid: false, errorMessage: L10n.invalidCreditCardNumberError)
    }
    
    guard CardUtils.luhnCheck(userInput) else {
      return (isValid: false, errorMessage: L10n.invalidCreditCardNumberError)
    }
    
    return (isValid: true, errorMessage: nil)
  }
  
  func updateCardNumberLength(_ length: IndexSet) {
    self.validCardNumberLength = length
  }
}
