//
//  CardUtilsTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-04.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class CardUtilsTest: QuickSpec {
  override func spec() {
    describe("Card Utils") {
      context("getCardType for valid card number prefix") {
        it("should return correct card type") {
          let validCardNumbers: [(CreditCardType, String)] = [
            (.visa, "4111111111111111"),
            (.visa, "41"),
            (.visa, "444"),
            (.amex, "343"),
            (.amex, "347"),
            (.amex, "347123"),
            (.amex, "3431234"),
            (.masterCard, "5425233430109903"),
            (.masterCard, "2222420000001113"),
            (.masterCard, "222300"),
            (.maestro, "6759239617181148"),
            (.maestro, "6763013828195278"),
            (.maestro, "5038487593682267"),
            (.dinersClub, "36899997254506"),
            (.dinersClub, "36905695522290"),
            (.dinersClub, "36382646232892"),
            (.dinersClub, "30282161418353"),
            (.dinersClub, "30489697333317"),
            (.dinersClub, "30274381884498"),
            (.jcb, "3531641924371530"),
            (.jcb, "3539002243194636"),
            (.jcb, "3535664760717057036"),
            (.discover, "6011347046421383"),
            (.discover, "6011364492597624"),
            (.discover, "6011770338084496986")
          ]
          validCardNumbers.forEach {
            expect(CardUtils.getCardType($0.1)) == $0.0
          }
        }
      }
      
      context("getCardType for invalid card number prefix") {
        it("should return nil") {
          let invalidCardNumberPrefix = ["123", "1111", "0000", "222", "999", "888"]
          invalidCardNumberPrefix.forEach {
            expect(CardUtils.getCardType($0)).to(beNil())
          }
        }
      }
      
      context("luhnCheck") {
        it("for valid card number should return true") {
          [
           "4024007121717382", "5410062367312058", "377792291559679",
           "6011277252453178", "3535443384915880", "5515098275200310",
           "30578097355001", "36328845450769", "5020604028867673",
           "4508410888328713", "6383041338120759"
          ].forEach {
            expect(CardUtils.luhnCheck($0)).to(beTrue())
          }
        }
        it("for invalid card number should return false") {
          [
           "412345678888", "", "asdf", "****"
          ].forEach {
            expect(CardUtils.luhnCheck($0)).to(beFalse())
          }
        }
      }
    }
  }
}
