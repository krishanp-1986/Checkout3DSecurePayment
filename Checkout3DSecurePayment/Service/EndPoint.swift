//
//  EndPoint.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

enum EndPoint {
  private static let baseUrl = "https://integrations-cko.herokuapp.com"
  
  case pay
  
  private var path: String {
    switch self {
    case .pay:
      return "/pay"
    }
  }
  
  private var httpMethod: String {
    switch self {
    case .pay:
      return "POST"
    }
  }
  
  var request: URLRequest? {
    var urlComponents = URLComponents(string: Self.baseUrl)
    urlComponents?.path = path
    guard let url = urlComponents?.url else { return nil }
    var request = URLRequest(url: url)
    request.httpMethod = self.httpMethod
    return request
  }
}
