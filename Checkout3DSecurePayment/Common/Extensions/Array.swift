//
//  Array.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

extension Array where Element == [String: Any] {
  func merged() -> [String: Any] {
    reduce(into: [String: String]()) { $0.merge($1) { $1 } }
  }
}
