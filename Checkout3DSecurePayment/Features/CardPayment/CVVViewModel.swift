//
//  CVVViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

class CVVViewModel: InputViewModel {
  override init(key: String = Constants.ApiKeys.cvv, placeHolder: String = L10n.cvvPlaceholder) {
    super.init(key: key, placeHolder: placeHolder)
  }
}
