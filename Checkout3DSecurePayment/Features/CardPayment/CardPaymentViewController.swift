//
//  ViewController.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import UIKit

class CardPaymentViewController: BaseViewController<CardPaymentViewModelProtocol> {
  private lazy var formInputViews: [InputViewValidatable] = []
  
  override func bind() {
    self.viewModel.updateViewBasedOn = { [unowned self] state in
      switch state {
      case .cardDetected(let cardType):
        self.acceptedCardsView.selectedCardType = cardType
      case .redirected:
        self.submitButton.stopLoading()
      case .error(let error):
        self.submitButton.stopLoading()
        self.displayBasicAlert(for: error)
      }
    }
    formInputViews = self.viewModel.fetchFormModels().map(transformToView(_:))
    buildUI(with: formInputViews)
  }
  
  private func transformToView(_ viewModel: InputViewDataProvidable) -> InputViewValidatable {
    switch viewModel {
    case is ExpiryCVVViewModel :
      return ExpiryCVVView(with: viewModel)
    default:
      return InputView(with: viewModel)
    }
  }
  
  private func buildUI(with formInputViews: [UIView]) {
    var views = formInputViews
    views.insert(acceptedCardsView, at: 0)
    views.append(submitButton)
    let containerStackView = createFormViewContainer(views)
    self.view.addSubview(containerStackView)
    let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
    containerStackView.snp.makeConstraints {
      $0.left.right.top.equalTo(safeAreaLayoutGuide).inset(grid(2))
    }
    
    submitButton.snp.makeConstraints {
      $0.left.right.bottom.equalToSuperview()
      $0.height.equalTo(grid(7))
    }
  }
  
  private func createFormViewContainer(_ views: [UIView]) -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: views)
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.spacing = CGFloat(DesignSystem.shared.sizer.sm)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }
  
  private lazy var acceptedCardsView: AcceptedCardsView = {
    let view = AcceptedCardsView(with: CreditCardType.allCases)
    return view
  }()
  
  private lazy var submitButton: Button = {
    let button = Button()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(L10n.pay, for: .normal)
    button.addTarget(self, action: #selector(payButtonClicked), for: .touchUpInside)
    return button
  }()
  
  @objc func payButtonClicked() {
    var isValidForm = true
    self.formInputViews.forEach {
      let isValidField = $0.isValid()
      isValidForm = isValidForm && isValidField
      if !isValidField {
        $0.setToErrorState()
      }
    }
    
    guard isValidForm else { return }
    let values = self.formInputViews.map({ $0.getValue() }).merged()
    self.submitButton.startLoading()
    self.viewModel.submitPayment(values)
  }
}
