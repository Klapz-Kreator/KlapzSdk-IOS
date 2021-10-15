//
//  ExampleBottomSheetView.swift
//  BottomSheetExample
//
//  Created by Gaetano Matonti on 22/11/20.
//

import UIKit
import PhoneNumberKit


final class ExampleBottomSheetView: UIView {
  
  // MARK: - UI Elements
  
  let titleLabel = UILabel()
    let descibelable = UILabel()
  let goldBorderedUIView = UIView()
  let descriptionLabel = UILabel()
    let descriptionLabelOTP = UILabel()
    let borderUI = CALayer()
  var text = ""
  var OTPField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
  let button = UIButton(type: .system)
    
    let buttonverify = UIButton(type: .system)
    
  let textField = PhoneNumberTextField()
   
    
    lazy var Header: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [titleLabel])
        stack.axis = .horizontal
        stack.spacing = 16
  //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()
    
      lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [Header,descriptionLabel,descibelable,textField, button])
        stack.axis = .vertical
        stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
        return stack
      }()
    
    
    
    lazy var contentStackotp: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [Header , descriptionLabelOTP,OTPField,buttonverify])
      stack.axis = .vertical
      stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()
    
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    self.textField.placeholder = "Enter phone number"
    self.textField.withFlag = true
    self.textField.withPrefix = true
    textField.frame = textField.frame.inset(by: UIEdgeInsets(top: .zero, left: 5.0, bottom: 5.0, right: .zero))
    textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: 56))
    self.textField.textColor =  UIColor(hexString: "#FFFFFF")
    textField.backgroundColor = UIColor(hexString: "#ff946d")
    textField.layer.cornerRadius = 10
    
    
    self.OTPField.placeholder = "Enter Code"
    OTPField.frame = OTPField.frame.inset(by: UIEdgeInsets(top: .zero, left: 5.0, bottom: 5.0, right: .zero))
    OTPField.addConstraint(OTPField.heightAnchor.constraint(equalToConstant: 56))
    self.OTPField.textColor =  UIColor(hexString: "#FFFFFF")
    OTPField.backgroundColor = UIColor(hexString: "#ff946d")
    OTPField.layer.cornerRadius = 10
    
    self.Header.layer.borderWidth = 0
    self.Header.layer.borderColor = UIColor(hexString: "#000000").cgColor
    self.Header.layer.frame = CGRect(x: 0, y: self.Header.frame.size.height - 1, width: self.Header.frame.size.width, height: 1)
    button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    buttonverify.addTarget(self, action: #selector(buttonVerifyClicked), for: .touchUpInside)
    setup()
    style()
  }
  
    
    @objc func buttonClicked() {
        setupOtp()
        print(String(textField.text ?? "asd"))
    }
    
    @objc func buttonVerifyClicked() {
        print(String(OTPField.text ?? "asd"))
    }
    
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
    style()
    
  }
  
  // MARK: - SSUL
  
  private func setup() {
    addSubview(contentStack)
    setConstraints()
  }
    
private func setupOtp() {
  contentStack.removeFromSuperview()
  addSubview(contentStackotp)
  setConstraintsOtp()
}
  
  private func style() {
    ExampleBottomSheetView.styleView(self)
    ExampleBottomSheetView.styleTitleLabel(
      titleLabel,
      with: "Login/Register With Klapz"
    )
    ExampleBottomSheetView.styleTitleLabel(
        descriptionLabel,
      with: "What's your Mobile\nnumber?"
    )
    ExampleBottomSheetView.styleTitleLabel(
        descriptionLabelOTP,
      with: "Enter the 4 digit code"
    )
    ExampleBottomSheetView.styleSmalltext(
     descibelable,
      with: "You will receive a 4 digit code\non this number, by  SMS"
    )
    ExampleBottomSheetView.styleButton(button)
    ExampleBottomSheetView.styleButtonMain(buttonverify)
  }
  
  // MARK: - Functions
  
  func setConstraints() {
    contentStack.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
//      contentStack.topAnchor.constraint(equalTo: topAnchor),
      contentStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      contentStack.trailingAnchor.constraint(equalTo: trailingAnchor),
//      contentStack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

//    border.frame = CGRectMake(-1, -1, CGRectGetWidth(leftScrollView.frame), CGRectGetHeight(leftScrollView.frame)+2)
  }
  
    func setConstraintsOtp() {
        contentStackotp.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
  //      contentStack.topAnchor.constraint(equalTo: topAnchor),
        contentStackotp.leadingAnchor.constraint(equalTo: leadingAnchor),
        contentStackotp.trailingAnchor.constraint(equalTo: trailingAnchor),
  //      contentStack.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
    }
    
}

// MARK: - Styling Functions

extension ExampleBottomSheetView {
  static func styleView(_ view: ExampleBottomSheetView) {
    if #available(iOS 13, *) {
      view.backgroundColor = UIColor(hexString: "#ff7f57")
    } else {
      view.backgroundColor =  UIColor(hexString: "#ff7f57")
    }
  }
  
  static func styleTitleLabel(_ label: UILabel, with text: String?) {
    label.text = text
    label.font = .preferredFont(forTextStyle: .headline)
    label.numberOfLines = 0
    label.font = UIFont(name: label.font.fontName, size: 20)
    label.textAlignment = .center
    label.textColor =  UIColor(hexString: "#FFFFFF")
    label.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
  
  static func styleDescriptionLabel(_ label: UILabel, with text: String?) {
    label.text = text
    label.font = UIFont(name: label.font.fontName, size: 20)
    label.numberOfLines = 0
    label.textColor =  UIColor(hexString: "#FFFFFF")
    label.textAlignment = .center
  }
    
    static func styleSmalltext(_ label: UILabel, with text: String?) {
      label.text = text
      label.font = UIFont(name: label.font.fontName, size: 14)
      label.numberOfLines = 0
      label.frame = CGRect(x: 0, y: label.frame.size.height - 1, width: label.frame.size.width, height: 1)
      label.textColor =  UIColor(hexString: "#FFFFFF")
      label.textAlignment = .center
    }
  
  static func styleButton(_ button: UIButton) {
    button.backgroundColor = .white
    button.setTitle("Next", for: .normal)
    button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
    button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    button.layer.cornerRadius = 8
  }
    static func styleButtonMain(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Verify", for: .normal)
      button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
    }
}
