//
//  swift
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
  
  let creditCardNumber = localize("number")
  let creditCardNumberPlaceHolder = localize("credit_card_number_placeholder")
  let expiryDate = localize("expiry_date")
  let expiryDatePlaceholder = localize("expiry_date_placeholder")
  let cvv = localize("cvv")
  let cvvPlaceholder = localize("cvv_placeholder")
  let pay = localize("pay")
  let acceptedCards = localize("accepted_cards")
  let emptyCreditCardNumberError = localize("empty_credit_card_number")
  let invalidCreditCardNumberError = localize("invalid_credit_card_number")
  let emptyExpiryDateError = localize("empty_expiry_date_error")
  let invalidExpiryDateFormatError = localize("invalid_expiry_date_format")
  let pastExpiryDateFormatError = localize("old_expiry_date_format")
  let emptyCvvError = localize("empty_cvv_error")
  let invalidCVVLengthError = localize("invalid_cvv_length_error")
  let paymentSuccess = localize("payment_success")
  let paymentFailed = localize("payment_failed")
  
  private static func localize(_ key: String) -> String {
    NSLocalizedString(key, comment: "")
  }
  
  func value(for key: String) -> String {
    Self.localize(key)
  }
}
