//
//  CVVViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

class CVVViewModel: InputViewModel {
  override var maxCharacterCount: Int? {
    didSet {
      guard let count = maxCharacterCount else { return }
      let cvvValidator = self.validator as? CVVValidator
      cvvValidator?.setCvvLength(count)
    }
  }
  override init(key: String = Constants.ApiKeys.cvv, placeHolder: String = L10n.cvvPlaceholder, formatter: Formattable? = nil, validator: Validator? = CVVValidator()) {
    super.init(key: key, placeHolder: placeHolder, validator: validator)
  }
}
