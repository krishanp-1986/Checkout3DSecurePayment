//
//  ExpiryCVVViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

class ExpiryViewModel: InputViewModel {
  override init(key: String = Constants.ApiKeys.expiryDate, placeHolder: String = L10n.expiryDatePlaceholder, formatter: Formattable? = ExpiryDateFormatter(), validator: Validator? = ExpiryDateValidator()) {
    super.init(key: key, placeHolder: placeHolder, formatter: formatter, validator: validator)
    self.maxCharacterCount = 7
  }
  
  override func getValue() -> [String: Any?] {
    let year = self.value?.prefix(4)
    let month = self.value?.suffix(2)
    return [
      Constants.ApiKeys.expiryYear: Int(String(year ?? "")),
      Constants.ApiKeys.expiryMonth: Int(String(month ?? ""))
    ]
  }
}
