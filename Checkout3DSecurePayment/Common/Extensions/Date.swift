//
//  Date.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import Foundation

public extension Date {
  func endOfMonth() -> Date? {
    guard let startOfMonth = self.startOfMonth() else {
      return nil
    }
    return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)
  }
  
  func startOfMonth() -> Date? {
    return Calendar
      .current
      .date(from: Calendar.current.dateComponents(
        [.year, .month],
        from: Calendar.current.startOfDay(for: self))
      )
  }
  
  func isGreaterOrEqual(date: Date) -> Bool {
    self >= date
  }
}
