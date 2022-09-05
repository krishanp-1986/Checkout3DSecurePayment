//
//  CreditCardInputViewModelTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class CreditCardInputViewModelTest: QuickSpec {
  override func spec() {
    describe("Credit card input viewmodel") {
      context("set value") {
        it("should update credit card type") {
          let sut = CreditCardInputViewModel()
          sut.cardTypeListener = { cardType in
            expect(cardType).to(equal(CreditCardType.visa))
          }
          let cardNumber = "4111111111111111"
          sut.setValue(value: cardNumber)
        }
        it("should update card number length") {
          let sut = CreditCardInputViewModel()
          let crediCardValidator = sut.validator as? CreditCardValidator
          let cardNumber = "4111111111111111"
          sut.setValue(value: cardNumber)
          expect(crediCardValidator?.validCardNumberLength.last) == 16
          
          sut.setValue(value: "378282246310005")
          expect(crediCardValidator?.validCardNumberLength.last) == 15
        }
      }
    }
  }
}
