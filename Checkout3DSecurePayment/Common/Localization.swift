//
//  Localization.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

// swiftlint: disable identifier_name
let L10n = Localization.shared
// swiftlint: enable identifier_name

struct Localization {
  static let shared = Localization()
  private init() {}
  
  let creditCardNumber = Localization.loaclize("credit_card_number")
  let creditCardNumberPlaceHolder = Localization.loaclize("credit_card_number_placeholder")
  let expiryDate = Localization.loaclize("expiry_date")
  let expiryDatePlaceholder = Localization.loaclize("expiry_date_placeholder")
  let cvv = Localization.loaclize("cvv")
  let cvvPlaceholder = Localization.loaclize("cvv_placeholder")
  let pay = Localization.loaclize("pay")
  let acceptedCards = Localization.loaclize("accepted_cards")
  let emptyCreditCardNumberError = Localization.loaclize("empty_credit_card_number")
  let invalidCreditCardNumberError = Localization.loaclize("invalid_credit_card_number")
  let emptyExpiryDateError = Localization.loaclize("empty_expiry_date_error")
  let invalidExpiryDateFormatError = Localization.loaclize("invalid_expiry_date_format")
  let pastExpiryDateFormatError = Localization.loaclize("old_expiry_date_format")
  let emptyCvvError = Localization.loaclize("empty_cvv_error")
  let invalidCVVLengthError = Localization.loaclize("invalid_cvv_length_error")
  
  private static func loaclize(_ key: String) -> String {
    NSLocalizedString(key, comment: "")
  }
  
  func value(for key: String) -> String {
    Self.loaclize(key)
  }
}
