//
//  PaymentCompleteViewController.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-05.
//

import UIKit

class PaymentCompleteViewController: UIViewController {
  init(with isPaymentSuccess: Bool) {
    super.init(nibName: nil, bundle: nil)
    self.buildUI(isPaymentSuccess)
    self.view.backgroundColor = DesignSystem.shared.colors.backgroundPrimary
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func buildUI(_ isPaymentSuccess: Bool) {
    self.view.addSubview(container)
    let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
    container.snp.makeConstraints {
      $0.center.equalTo(safeAreaLayoutGuide)
    }
    icon.image = isPaymentSuccess ? UIImage(named: "payment_success") : UIImage(named: "payment_failure")
    icon.snp.makeConstraints {
      $0.width.height.equalTo(grid(10))
    }
    headerLabel.text = isPaymentSuccess ? L10n.paymentSuccess : L10n.paymentFailed
  }
  
  private lazy var icon: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var headerLabel: UILabel = {
    let label = UILabel()
    label.font = DesignSystem.shared.fonts.headerTitle
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var container: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [icon, headerLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = CGFloat(grid(2))
    return stackView
  }()
}
