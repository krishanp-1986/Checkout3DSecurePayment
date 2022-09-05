//
//  MockNetworkAgent.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import Foundation
@testable import Checkout3DSecurePayment

class MockNetworkAgent: DataProvider {
  private let bundle = Bundle(for: MockNetworkAgent.self)
  var mockFileName: String = ""
  
  func execute<T>(_ request: URLRequest, whenDone: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
    DispatchQueue.main.async {
      guard let decodable = JsonUtils.convertJsonIntoDecodable(T.self,
                                                               fileName: self.mockFileName,
                                                               bundle: self.bundle, inDirectory: "TestResponse") else {
        
        whenDone(.failure(.inValidData))
        return
      }
      
      whenDone(.success(decodable))
    }
  }
}
