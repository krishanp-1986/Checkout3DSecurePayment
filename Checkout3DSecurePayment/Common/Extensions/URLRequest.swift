//
//  URLRequest.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

extension URLRequest {
  mutating func jsonHeader() {
    self.setValue("application/json", forHTTPHeaderField: "Content-Type")
  }
  
  mutating func requestBody<T>(_ input: T) where T: Encodable {
    self.httpBody = try? JSONEncoder().encode(input)
  }
}
