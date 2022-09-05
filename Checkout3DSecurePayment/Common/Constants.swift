//
//  Constants.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

struct Constants {
  struct ApiKeys {
    static let creditCardNumber = "number"
    static let expiryDate = "expiry_date"
    static let expiryYear = "expiry_year"
    static let expiryMonth = "expiry_month"
    static let cvv = "cvv"
    static let pay = "pay"
  }
  
  static let successUrl = "https://success.com"
  static let failureUrl = "https://fail.com"
  
  struct NSErrorConstants {
    static let nsErrorDomain = "com.checkout.3dpayment"
    static let failedRequestErrorCode = -999
  }
}

/// Global function
func grid(_ value: Int) -> Int {
  DesignSystem.shared.sizer.sm * value
}
