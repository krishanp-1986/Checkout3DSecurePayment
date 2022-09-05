//
//  DateExtensionTests.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class DateExtensionTests: QuickSpec {
  private func getDateComponents(from date: Date) -> DateComponents {
    Calendar.current.dateComponents([.day, .year, .month], from: date)
  }
  private func createTestDate(form string: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    return dateFormatter.date(from: string)
  }
  
  override func spec() {
    describe("Date extension") {
      context("start of month") {
        it("for valid date it should return the month date") {
          let date = Date()
          let month = self.getDateComponents(from: date).month
          let startOfMonthfromExtension = date.startOfMonth()
          expect(startOfMonthfromExtension).toNot(beNil())
          // swiftlint:disable force_unwrapping
          expect(self.getDateComponents(from: startOfMonthfromExtension!).month) == month
          expect(self.getDateComponents(from: startOfMonthfromExtension!).day) == 1
          // swiftlint:enable force_unwrapping
        }
      }
      
      context("end of month") {
        it("for valid date it should return the month date") {
          let date = Date()
          let month = self.getDateComponents(from: date).month
          let endOfMonthfromExtension = date.endOfMonth()
          
          expect(endOfMonthfromExtension).toNot(beNil())
          // swiftlint:disable force_unwrapping
          expect(self.getDateComponents(from: endOfMonthfromExtension!).month) == month
          
          let testDate: Date? = self.createTestDate(form: "2022/09/05")
          
          let testDateEndOfMonth = testDate?.endOfMonth()
          expect(self.getDateComponents(from: testDateEndOfMonth!).month) == 9
          expect(self.getDateComponents(from: testDateEndOfMonth!).day) == 30
          // swiftlint:enable force_unwrapping
        }
      }
      
      context("is greater or equal") {
        it("should return true for past date") {
          let currentDate = Date()
          expect(currentDate.isGreaterOrEqual(date: currentDate)).to(beTrue())
          // swiftlint:disable force_unwrapping
          let pastDate: Date? = self.createTestDate(form: "2021/09/05")
          expect(currentDate.isGreaterOrEqual(date: pastDate!)).to(beTrue())
          // swiftlint:enable force_unwrapping
        }
        
        it("should return false for future date") {
          let currentDate = Date()
          expect(currentDate.isGreaterOrEqual(date: Date())).to(beFalse())
          // swiftlint:disable force_unwrapping
          let futureDate: Date? = self.createTestDate(form: "3000/09/05")
          expect(currentDate.isGreaterOrEqual(date: futureDate!)).to(beFalse())
          // swiftlint:enable force_unwrapping
        }
      }
    }
  }
}
