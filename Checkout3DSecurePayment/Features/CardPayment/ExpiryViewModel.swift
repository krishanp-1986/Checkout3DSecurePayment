//
//  ExpiryCVVViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

class ExpiryViewModel: InputViewModel {
  override init(key: String = Constants.ApiKeys.expiryDate, placeHolder: String = L10n.expiryDatePlaceholder) {
    super.init(key: key, placeHolder: placeHolder)
  }
}
