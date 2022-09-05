//
//  ExpiryCVVViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

class ExpiryCVVViewModel: InputViewModel {
  var updateCVVLengthListener: ((Int) -> Void)?
  override var maxCharacterCount: Int? {
    didSet {
      guard let count = maxCharacterCount else { return }
      self.updateCVVLengthListener?(count)
    }
  }
}
