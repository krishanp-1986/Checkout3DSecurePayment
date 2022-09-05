//
//  ExpiryDateValidatorTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class ExpiryDateValidatorTest: QuickSpec {
  override func spec() {
    describe("Expiry date validator") {
      var sut: ExpiryDateValidator!
      beforeEach {
        sut = ExpiryDateValidator()
      }
      context("isValid for empty expiry date") {
        it("it should return false") {
          let validationResult = sut.isValid("")
          let isValid = validationResult.isValid
          expect(isValid).to(beFalse())
        }
        it("it should return invalid expiry date formatter message") {
          let validationResult = sut.isValid("")
          let errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidExpiryDateFormatError
        }
      }
      
      context("isValid for invalid expiry date") {
        it("it should return false") {
          var validationResult = sut.isValid("2022")
          var isValid = validationResult.isValid
          expect(isValid).to(beFalse())
          
          validationResult = sut.isValid("202112")
          isValid = validationResult.isValid
          expect(isValid).to(beFalse())
        }
        it("it should return invalid expiry date formatter message") {
          var validationResult = sut.isValid("2022")
          var errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.invalidExpiryDateFormatError
          
          validationResult = sut.isValid("202112")
          errorMessage = validationResult.errorMessage
          expect(errorMessage) == L10n.pastExpiryDateFormatError
        }
      }
      
      context("isValid for valid expiry date") {
        it("it should return true") {
          let validationResult = sut.isValid("300012")
          let isValid = validationResult.isValid
          expect(isValid).to(beTrue())
        }
      }
    }
  }
}
