//
//  DataProvider.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

protocol DataProvider {
  func execute<T: Decodable>(_ request: URLRequest, whenDone: @escaping (Result<T, ServiceError>) -> Void)
}

enum ServiceError: Error {
  case invalidResponse
  case unSuccessfulResponse(Int)
  case inValidData
  case generalError(Error)
}

extension ServiceError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .invalidResponse:
      return "Invalid Response"
    case .inValidData:
      return "Server failed to return Data"
    case .unSuccessfulResponse(let errorCode):
      return "Server replied with errorCode : \(errorCode)"
    case .generalError(let error):
      return error.localizedDescription
    }
  }
}
