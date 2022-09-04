//
//  Constants.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

struct Constants {
  struct ApiKeys {
    static let creditCardNumber = "credit_card_number"
    static let expiryDate = "expiry_date"
    static let cvv = "cvv"
    static let pay = "pay"
  }
}

/// Global function
func grid(_ value: Int) -> Int {
  DesignSystem.shared.sizer.sm * value
}
