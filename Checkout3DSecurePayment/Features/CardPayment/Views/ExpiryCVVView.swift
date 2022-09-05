//
//  ExpiryCVVView.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-03.
//

import UIKit

final class ExpiryCVVView: UIView, InputViewValidatable {
  func setToErrorState() {
    expiryDateInputView.setToErrorState()
    cvvInputField.setToErrorState()
  }
  
  func setToNormalState() {
    expiryDateInputView.setToNormalState()
    cvvInputField.setToNormalState()
  }
  
  func setToErrorState(_ errorMessage: String) {
    expiryDateInputView.setToErrorState(errorMessage)
    cvvInputField.setToErrorState(errorMessage)
  }
  
  var viewModel: InputViewDataProvidable
  
  init(with viewModel: InputViewDataProvidable) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    buildUI()
    (self.viewModel as? ExpiryCVVViewModel)?.updateCVVLengthListener = { [unowned self] length in
      self.cvvViewModel.maxCharacterCount = length
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func buildUI() {
    self.addSubview(container)
    container.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func isValid() -> Bool {
    expiryDateInputView.isValid() && cvvInputField.isValid()
  }
  
  func getValue() -> [String: Any?] {
    let expiryValues = self.expiryDateInputView.getValue().merging(self.cvvInputField.getValue()) {_, cvvkey in
      cvvkey
    }
    return expiryValues
  }
  
  
  private lazy var expiryDateInputView: InputViewValidatable = {
    let inputView = InputView(with: ExpiryViewModel())
    inputView.translatesAutoresizingMaskIntoConstraints = false
    return inputView
  }()
  
  private lazy var cvvInputField: InputViewValidatable = {
    let inputView = InputView(with: self.cvvViewModel, isSecuredEntry: true)
    inputView.translatesAutoresizingMaskIntoConstraints = false
    return inputView
  }()
  
  private lazy var cvvViewModel: CVVViewModel = {
    CVVViewModel()
  }()
  
  lazy var container: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [expiryDateInputView, cvvInputField])
    stackView.axis = .horizontal
    stackView.alignment = .top
    stackView.distribution = .fillEqually
    stackView.spacing = CGFloat(DesignSystem.shared.sizer.sm)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
}
