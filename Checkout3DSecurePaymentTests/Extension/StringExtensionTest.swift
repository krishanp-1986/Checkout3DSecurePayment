//
//  StringExtensionTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class StringExtensionTest: QuickSpec {
  override func spec() {
    describe("String extension") {
      context("credit card expiry date") {
        it("for valid date string it should return date") {
          ["199212", "198612", "202201", "300012"].forEach {
            expect($0.creditCardExpiryDate).toNot(beNil())
          }
        }
        it("for invalid date string it should return nil") {
          ["202223", "232022"].forEach {
            expect($0.creditCardExpiryDate).to(beNil())
          }
        }
      }
    }
  }
}
