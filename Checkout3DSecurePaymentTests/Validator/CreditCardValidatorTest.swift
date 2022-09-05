//
//  CreditCardValidatorTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class CreditCardValidatorTest: QuickSpec {
  override func spec() {
    describe("Creditcard validator") {
      var sut: CreditCardValidator!
      beforeEach {
        sut = CreditCardValidator()
      }
      context("isValid for empty credit card number") {
        it("it should return false") {
          let validationResult = sut.isValid("")
          let isValid = validationResult.isValid
          expect(isValid).to(beFalse())
        }
        it("it should return invalid credit card number message") {
          let validationResult = sut.isValid("")
          let errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidCreditCardNumberError
        }
      }
      
      context("isValid for incorrect cardnumber length") {
        it("it should return false") {
          var validationResult = sut.isValid("123456")
          var isValid = validationResult.isValid
          expect(isValid).to(beFalse())
          
          sut.updateCardNumberLength(IndexSet(integer: 12))
          validationResult = sut.isValid("1234567890000000")
          isValid = validationResult.isValid
          expect(isValid).to(beFalse())
        }
        
        it("it should return invalid credit card number message") {
          var validationResult = sut.isValid("123456")
          var errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidCreditCardNumberError
          
          sut.updateCardNumberLength(IndexSet(integer: 12))
          validationResult = sut.isValid("1234567890000000")
          errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidCreditCardNumberError
        }
      }
      
      context("isValid for incorrect Luhn check") {
        it("it should return false") {
          var validationResult = sut.isValid("1234567890000000")
          var isValid = validationResult.isValid
          expect(isValid).to(beFalse())
          
          sut.updateCardNumberLength(IndexSet(integer: 12))
          validationResult = sut.isValid("123456789000")
          isValid = validationResult.isValid
          expect(isValid).to(beFalse())
        }
        
        it("it should return invalid credit card number message") {
          var validationResult = sut.isValid("1234567890000000")
          var errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidCreditCardNumberError
          
          sut.updateCardNumberLength(IndexSet(integer: 12))
          validationResult = sut.isValid("123456789000")
          errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidCreditCardNumberError
        }
      }
      
      context("isValid for valid card number") {
        it("it should return true") {
          var validationResult = sut.isValid("4024007161996680")
          var isValid = validationResult.isValid
          expect(isValid).to(beTrue())
          
          sut.updateCardNumberLength(IndexSet(integer: 15))
          validationResult = sut.isValid("374704960044324")
          isValid = validationResult.isValid
          expect(isValid).to(beTrue())
          
          sut.updateCardNumberLength(IndexSet(integer: 14))
          validationResult = sut.isValid("36275611057049")
          isValid = validationResult.isValid
          expect(isValid).to(beTrue())
        }
      }
    }
  }
}
