//
//  NetworkAgent.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import Foundation

final class NetworkAgent: DataProvider {
  private let session: URLSession
  private var dataTask: URLSessionDataTask?
  
  init(with session: URLSession = URLSession.shared) {
    self.session = session
  }

  func execute<T>(_ request: URLRequest, whenDone: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {
    self.dataTask = session.dataTask(with: request) { data, response, error in
      DispatchQueue.main.async {
        if let responseError = error {
          whenDone(.failure(.generalError(responseError)))
          return
        }
        guard response != nil else {
          whenDone(.failure(.invalidResponse))
          return
        }
        let httpUrlResponseCode = (response as? HTTPURLResponse)?.statusCode ?? 500
        guard 200..<300 ~= httpUrlResponseCode else {
          whenDone(.failure(.unSuccessfulResponse(httpUrlResponseCode)))
          return
        }
        guard let responseData = data, !responseData.isEmpty else {
          whenDone(.failure(.inValidData))
          return
        }
        do {
          let responseModel = try JSONDecoder().decode(T.self, from: responseData)
          whenDone(.success(responseModel))
        } catch let error {
          whenDone(.failure(.generalError(error)))
        }
      }
    }
    self.dataTask?.resume()
  }
}
