//
//  CVVValidatorTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class CVVValidatorTest: QuickSpec {
  override func spec() {
    describe("CVV validator") {
      var sut: CVVValidator!
      beforeEach {
        sut = CVVValidator()
      }
      context("isValid for empty cvv") {
        it("it should return false") {
          let validationResult = sut.isValid("")
          let isValid = validationResult.isValid
          expect(isValid).to(beFalse())
        }
        it("it should return invalid cvv length message") {
          let validationResult = sut.isValid("")
          let errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.emptyCvvError
        }
      }
      
      context("isValid for invalid cvv length") {
        it("it should return false") {
          var validationResult = sut.isValid("1234")
          var isValid = validationResult.isValid
          expect(isValid).to(beFalse())
          
          validationResult = sut.isValid("12")
          isValid = validationResult.isValid
          expect(isValid).to(beFalse())
          
          sut.setCvvLength(4)
          validationResult = sut.isValid("123")
          isValid = validationResult.isValid
          expect(isValid).to(beFalse())
        }
        it("it should return invalid cvv length message") {
          var validationResult = sut.isValid("1234")
          var errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidCVVLengthError
          
          validationResult = sut.isValid("12")
          errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidCVVLengthError
          
          sut.setCvvLength(4)
          validationResult = sut.isValid("123")
          errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidCVVLengthError
        }
      }
      
      context("isValid for valid cvv") {
        it("it should return true") {
          var validationResult = sut.isValid("123")
          var isValid = validationResult.isValid
          expect(isValid).to(beTrue())
          
          sut.setCvvLength(4)
          validationResult = sut.isValid("1234")
          isValid = validationResult.isValid
          expect(isValid).to(beTrue())
        }
      }
    }
  }
}
