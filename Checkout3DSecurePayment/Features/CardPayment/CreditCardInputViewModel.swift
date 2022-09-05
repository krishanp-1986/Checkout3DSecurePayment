//
//  CreditCardInputViewModel.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import Foundation

class CreditCardInputViewModel: InputViewModel {
  private(set) var creditCardType: CreditCardType? {
    didSet {
      if let validCardNumberLength = creditCardType?.validNumberLength {
        self.creditCardValidator?.updateCardNumberLength(validCardNumberLength)
      }
      self.cardTypeListener?(creditCardType)
    }
  }
  
  private var creditCardValidator: CreditCardValidator? {
    self.validator as? CreditCardValidator
  }
  
  var cardTypeListener: ((CreditCardType?) -> Void)?
  
  override init(
    key: String = Constants.ApiKeys.creditCardNumber,
    placeHolder: String = L10n.creditCardNumberPlaceHolder,
    formatter: Formattable? = CreditCardNumberFormatter(),
    validator: Validator? = CreditCardValidator()
  ) {
    super.init(key: key, placeHolder: placeHolder, formatter: formatter, validator: validator)
  }
  
  override func setValue(value: String?) {
    super.setValue(value: value)
    let cardType = CardUtils.getCardType(value)
    if self.creditCardType != cardType {
      self.creditCardType = cardType
    }
    
    if let card = cardType,
    let creditCardFormatter = self.formatter as? CreditCardNumberFormatter {
      creditCardFormatter.grouping = card.spacing
      self.maxCharacterCount = (card.validNumberLength.last ?? 16) + card.spacing.count
    }
  }
}
