//
//  CreditCardNumberFormatterTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class CreditCardNumberFormatterTest: QuickSpec {
  override func spec() {
    describe("Credi card number formatter") {
      var sut: CreditCardNumberFormatter!
      beforeEach {
        sut = CreditCardNumberFormatter()
      }
      context("format string when revers false") {
        it("should return formatted card number") {
          let creditCardNumber = "41111111111111111"
          var formattedString = sut.formatString(creditCardNumber)
          expect(formattedString) == "4111 1111 1111 11111"
          
          sut.grouping = [4, 10]
          formattedString = sut.formatString(creditCardNumber)
          expect(formattedString) == "4111 111111 1111111"
        }
      }
      
      context("format string when revers true") {
        it("should return non formatted card number") {
          let creditCardNumber = "4111 1111 1111 11111"
          var formattedString = sut.formatString(creditCardNumber, reverse: true)
          expect(formattedString) == "41111111111111111"
          
          sut.grouping = [4, 10]
          formattedString = sut.formatString("4111 111111 1111111", reverse: true)
          expect(formattedString) == "41111111111111111"
        }
      }
    }
  }
}
