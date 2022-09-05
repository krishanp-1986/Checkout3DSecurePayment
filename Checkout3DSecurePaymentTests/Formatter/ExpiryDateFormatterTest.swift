//
//  ExpiryDateFormatterTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class ExpiryDateFormatterTest: QuickSpec {
  override func spec() {
    describe("Expiry date formatter") {
      var sut: ExpiryDateFormatter!
      beforeEach {
        sut = ExpiryDateFormatter()
      }
      context("format string when revers false") {
        it("should return formatted expiry date") {
          let expiryDate = "202223"
          var formattedString = sut.formatString(expiryDate)
          expect(formattedString) == "2022/23"
        
          formattedString = sut.formatString("2022")
          expect(formattedString) == "2022"
        }
      }
      
      context("format string when revers true") {
        it("should return non formatted expiry date") {
          let expiryDate = "2022/23"
          var formattedString = sut.formatString(expiryDate, reverse: true)
          expect(formattedString) == "202223"
          

          formattedString = sut.formatString("2022", reverse: true)
          expect(formattedString) == "2022"
        }
      }
    }
  }
}
