//
//  CreditCardInputViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

class CreditCardInputViewModel: InputViewModel {
  override init(key: String = Constants.ApiKeys.creditCardNumber, placeHolder: String = L10n.creditCardNumberPlaceHolder) {
    super.init(key: key, placeHolder: placeHolder)
  }
}
