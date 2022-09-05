//
//  CardPaymentViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

protocol CardPaymentViewModelProtocol {
  var cardTypeDetectedListener: ((CreditCardType?) -> Void)? { get set }
  func fetchFormModels() -> [InputViewDataProvidable]
  func submitPayment()
}

struct CardPaymentViewModel: CardPaymentViewModelProtocol {
  var cardTypeDetectedListener: ((CreditCardType?) -> Void)?
  func fetchFormModels() -> [InputViewDataProvidable] {
    // Expiry CVV Viewmodel
    let expiryCVVViewModel = ExpiryCVVViewModel()
    
    // Credit Card number viewmodel
    let creditCardInputViewModel = CreditCardInputViewModel()
    creditCardInputViewModel.cardTypeListener = { type in
      expiryCVVViewModel.maxCharacterCount = type?.cvvLength
      cardTypeDetectedListener?(type)
    }
    
    return [creditCardInputViewModel, expiryCVVViewModel]
  }
  
  func submitPayment() {
    
  }
}
