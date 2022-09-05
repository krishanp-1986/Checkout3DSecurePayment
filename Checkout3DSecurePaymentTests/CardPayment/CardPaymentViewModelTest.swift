//
//  CardPaymentViewModelTest.swift
//  Checkout3DSecurePaymentTests
//
//  Created by krishan on 2022-09-05.
//

import XCTest
import Quick
import Nimble
@testable import Checkout3DSecurePayment

class CardPaymentViewModelTest: QuickSpec {
  override func spec() {
    describe("CardPaymentViewModel") {
      var sut: CardPaymentViewModelProtocol!
      var mockUseCase: MockCardPaymentUseCase!
      beforeEach {
        mockUseCase = MockCardPaymentUseCase()
        sut = CardPaymentViewModel(with: mockUseCase)
      }
      context("fetch form models") {
        it("should return form field models") {
          expect(sut.fetchFormModels()).toNot(beEmpty())
          expect(sut.fetchFormModels().count) == 2
          expect(sut.fetchFormModels().first).to(beAnInstanceOf(CreditCardInputViewModel.self))
          expect(sut.fetchFormModels().last).to(beAnInstanceOf(ExpiryCVVViewModel.self))
        }
      }
      
      context("submit payment") {
        it("should transform to valid request body") {
          let paymentDetails: [String: Any] = ["number": "42424242424242", "expiry_month": 10, "expiry_year": 2023]
          sut.submitPayment(paymentDetails)
          expect(mockUseCase.requestBody).toNot(beNil())
          expect(mockUseCase.requestBody?.number) == "42424242424242"
          expect(mockUseCase.requestBody?.expiryYear) == 2023
          expect(mockUseCase.requestBody?.expiryMonth) == 10
          expect(mockUseCase.requestBody?.successUrl).toNot(beNil())
          expect(mockUseCase.requestBody?.failureUrl).toNot(beNil())
        }
        
        it("for valid response should navigate to webview") {
          let paymentRedirectUrl = "https://www.3ds.com"
          mockUseCase.result = .success(.init(url: paymentRedirectUrl))
          
          sut.navigateToWebView = { urlToNavigate in
            expect(urlToNavigate).toEventually(equal(paymentRedirectUrl))
          }
          sut.submitPayment([:])
        }
        
        it("for valid response should call update view based on with redirect") {
          let paymentRedirectUrl = "https://www.3ds.com"
          mockUseCase.result = .success(.init(url: paymentRedirectUrl))
          
          sut.updateViewBasedOn = { state in
            expect(state) == .redirected
          }
          sut.submitPayment([:])
        }
        
        it("for invalid response should call update view based on with error") {
          mockUseCase.result = .failure(.invalidResponse)
          sut.updateViewBasedOn = { state in
            switch state {
            case .error(let error):
              expect(error.localizedDescription).to(equal(ServiceError.invalidResponse.localizedDescription))
            default:
              fail("Expected error got success")
            }
          }
          sut.submitPayment([:])
        }
      }
    }
  }
}

extension CardPaymentViewModel.State: Equatable {
  public static func == (lhs: CardPaymentViewModel.State, rhs: CardPaymentViewModel.State) -> Bool {
    switch (lhs, rhs) {
    case (.redirected, .redirected):
      return true
    case (.cardDetected(let lhsCardType), .cardDetected(let rhsCardType)):
      return lhsCardType == rhsCardType
    case (.error(let lhsError), .error(let rhsError)):
      return lhsError.localizedDescription == rhsError.localizedDescription
    default:
      return false
    }
  }
}

private final class MockCardPaymentUseCase: CardPaymentUseCase {
  private(set) var requestBody: PaymentRequestBody?
  var result: Result<PaymentResponse, ServiceError>?
  func pay(with data: PaymentRequestBody, whenDone: @escaping (Result<PaymentResponse, ServiceError>) -> Void) {
    self.requestBody = data
    guard let result = result else {
      return
    }
    whenDone(result)
  }
  
  var dataProvider: DataProvider!
}
