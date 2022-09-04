//
//  Button.swift
//  Checkout3DSecurePayment
//
//  Created by krishan on 2022-09-04.
//

import UIKit

public final class Button: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    configureActivityIndicator()
    self.backgroundColor = .clear
    self.titleLabel?.font = DesignSystem.shared.fonts.buttonTitle
    self.setTitleColor(DesignSystem.shared.colors.primary, for: .normal)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    DesignSystem.shared.styles.button(self)
  }
  
  private func configureActivityIndicator() {
    addSubview(indicator)
    indicator.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  private lazy var indicator: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .medium)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - Loading indicator management
  public func startLoading() {
    indicator.startAnimating()
    self.isEnabled = false
    self.titleLabel?.layer.opacity = 0.0
    self.imageView?.layer.opacity = 0.0
    if let color = titleColor(for: .normal) {
      indicator.color = color
    }
  }
  
  public func stopLoading() {
    indicator.stopAnimating()
    self.isEnabled = true
    self.titleLabel?.layer.opacity = 1.0
    self.imageView?.layer.opacity = 1.0
  }
}
