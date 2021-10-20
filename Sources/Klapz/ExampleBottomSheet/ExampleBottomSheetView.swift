//
//  ExampleBottomSheetView.swift
//  BottomSheetExample
//
//  Created by Gaetano Matonti on 22/11/20.
//

import UIKit
import PhoneNumberKit


public class ExampleBottomSheetView: UIView {
  
  // MARK: - UI Elements
  
  let titleLabel = UILabel()

    let descibelable = UILabel()
    let X = UILabel()
  let goldBorderedUIView = UIView()
  let descriptionLabel = UILabel()
  let descriptionLabelOTP = UILabel()
    let thnxtext = PaddingLabel()
  let borderUI = CALayer()
  var text = ""
  var OTPField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
  var KlapzField: UITextField = UITextField();
  let button = UIButton(type: .system)

    
  let myImageView:UIImageView = UIImageView()
   

    
  let buttonverify = UIButton(type: .system)
  
    let titlerclab = UILabel()
    let balanceKlapz = UILabel()
    let buttonklapz = UIButton(type: .system)
    let DownloadKlapz = UIButton(type: .system)
    var Klapxexpretion: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
    
    
  let textField = PhoneNumberTextField()
    
    var KlapzConfig: [String: Any] = [
        "key":"xxx"
    ]
    
    public func StartKlapz(Config:[String:Any]) {
        self.KlapzConfig = Config
        print(Config)
        print("Call api")
    }
    
    lazy var Header: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [titleLabel])
        stack.axis = .horizontal
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
  //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()
    
    lazy var Klapzview: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [myImageView,X,KlapzField])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
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
    
    
    
    lazy var thnxStakl: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [Header , thnxtext ,DownloadKlapz])
      stack.axis = .vertical
      stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()
    
    
    
    lazy var contentStackKlapz: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [Header , titlerclab,Klapxexpretion,Klapzview,buttonklapz,balanceKlapz])
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
    self.OTPField.tintColor =  UIColor(hexString: "#CCCCCC")
    textField.backgroundColor = UIColor(hexString: "#ff946d")
    textField.layer.cornerRadius = 10
    
    
    self.OTPField.placeholder = "Enter Code"
    OTPField.frame = OTPField.frame.inset(by: UIEdgeInsets(top: .zero, left: 5.0, bottom: 5.0, right: .zero))
    OTPField.addConstraint(OTPField.heightAnchor.constraint(equalToConstant: 56))
    self.OTPField.textColor =  UIColor(hexString: "#ffffff")
    self.OTPField.tintColor =  UIColor(hexString: "#CCCCCC")
    OTPField.backgroundColor = UIColor(hexString: "#ff946d")
    OTPField.layer.cornerRadius = 10
    
    self.Klapxexpretion.placeholder = "Tell us, what do you love about this book summary"
    self.Klapxexpretion.tintColor =  UIColor(hexString: "#CCCCCC")
    Klapxexpretion.frame = Klapxexpretion.frame.inset(by: UIEdgeInsets(top: .zero, left: 5.0, bottom: 5.0, right: .zero))
    
    Klapxexpretion.addConstraint(Klapxexpretion.heightAnchor.constraint(equalToConstant: 120))
    self.Klapxexpretion.textColor =  UIColor(hexString: "#FFFFFF")
    Klapxexpretion.backgroundColor = UIColor(hexString: "#ff946d")
    Klapxexpretion.layer.cornerRadius = 10
    
    
    self.KlapzField.placeholder = "0"
    KlapzField.frame = KlapzField.frame.inset(by: UIEdgeInsets(top: .zero, left: 5.0, bottom: 5.0, right: .zero))
    KlapzField.addConstraint(KlapzField.heightAnchor.constraint(equalToConstant: 56))
    KlapzField.addConstraint(KlapzField.widthAnchor.constraint(equalToConstant: 56))
    self.KlapzField.textColor =  UIColor(hexString: "#ffffff")
    KlapzField.textAlignment = .center
    self.KlapzField.tintColor =  UIColor(hexString: "#CCCCCC")
    KlapzField.backgroundColor = UIColor(hexString: "#ff946d")
    KlapzField.layer.cornerRadius = 10
    KlapzField.text = "2"
    
    self.Header.layer.borderWidth = 0
    self.Header.layer.borderColor = UIColor(hexString: "#000000").cgColor
    self.Header.layer.frame = CGRect(x: 0, y: self.Header.frame.size.height - 1, width: self.Header.frame.size.width, height: 1)
    button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    buttonverify.addTarget(self, action: #selector(buttonVerifyClicked), for: .touchUpInside)
    buttonklapz.addTarget(self, action: #selector(buttonVerifyKlapz), for: .touchUpInside)
    setup()
    titleLabel.font = UIFont(name: "HelveticaNeue-UltraLight",
                             size: 20.0)
    
    let catImage = UIImage(named: "klapzicon.png")
    myImageView.contentMode = UIView.ContentMode.scaleAspectFit
    myImageView.frame.size.width = 54
    myImageView.frame.size.height = 54
    myImageView.image = catImage
    
    style()
  }
  
    
    @objc func buttonClicked() {
        setupOtp()
        print(String(textField.text ?? "asd"))
    }
    
    @objc func buttonVerifyClicked() {
        setupKlapz()
        print(String(OTPField.text ?? "asd"))
    }
    
    
    @objc func buttonVerifyKlapz() {
        setupKlapzContent()
        print("Call api")
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
    
    private func setupKlapz() {
//      ExampleBottomSheetView.styleViewwhite(self)
        ExampleBottomSheetView.styleTitleLabel(
          titleLabel,
          with: "Klapz Club"
        )
      contentStackotp.removeFromSuperview()
      addSubview(contentStackKlapz)
      setConstraintsKLAPZ()
    }
  
    
    private func setupKlapzContent() {
//      ExampleBottomSheetView.styleViewwhite(self)
        ExampleBottomSheetView.styleTitleLabel(
          titleLabel,
          with: "Klapz Club"
        )
        contentStackKlapz.removeFromSuperview()
      addSubview(thnxStakl)
        setConstraintsContent()
    }
  
    
  private func style() {
    ExampleBottomSheetView.styleView(self)
    ExampleBottomSheetView.styleTitleLabelContent(
        titlerclab,
      with: "Title Content"
    )
//    label.font = UIFontMetrics.default.scaledFont(for: customFont)
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
    
    ExampleBottomSheetView.styleTitleLabelthnx(
        thnxtext,
      with: "Thanks for Klapping."
    )
    ExampleBottomSheetView.styleSmalltext(
     descibelable,
      with: "You will receive a 4 digit code\non this number, by  SMS"
    )
    ExampleBottomSheetView.styleSmalltext(
     X,
      with: "X"
    )
    
    ExampleBottomSheetView.styleSmalltext(
     balanceKlapz,
      with: "Your balance: 7"
    )
   
    ExampleBottomSheetView.styleButton(button)
    ExampleBottomSheetView.styleButtonMain(buttonverify)
    ExampleBottomSheetView.styleButtonKlapz(buttonklapz)
    ExampleBottomSheetView.styleButtonDownload(DownloadKlapz)
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
    
    func setConstraintsKLAPZ() {
        contentStackKlapz.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
  //      contentStack.topAnchor.constraint(equalTo: topAnchor),
        contentStackKlapz.leadingAnchor.constraint(equalTo: leadingAnchor),
        contentStackKlapz.trailingAnchor.constraint(equalTo: trailingAnchor),
  //      contentStack.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
    }
    
    
    func setConstraintsContent() {
        thnxStakl.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
  //      contentStack.topAnchor.constraint(equalTo: topAnchor),
        thnxStakl.leadingAnchor.constraint(equalTo: leadingAnchor),
        thnxStakl.trailingAnchor.constraint(equalTo: trailingAnchor),
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
    
    static func styleViewwhite(_ view: ExampleBottomSheetView) {
      if #available(iOS 13, *) {
        view.backgroundColor = UIColor(hexString: "#FFFFFF")
      } else {
        view.backgroundColor =  UIColor(hexString: "#FFFFFF")
      }
    }
  
  static func styleTitleLabel(_ label: UILabel, with text: String?) {
    label.text = text
    label.numberOfLines = 0
    label.font = UIFont(name:"Montserrat-Bold", size: 20.0)
    label.textAlignment = .center
    label.textColor =  UIColor(hexString: "#FFFFFF")
    label.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
    
    static func styleTitleLabelContent(_ label: UILabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.font = UIFont(name:"Montserrat-Regular", size: 20.0)
      label.textAlignment = .center
      label.textColor =  UIColor(hexString: "#FFFFFF")
      label.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    static func styleTitleLabelthnx(_ label: PaddingLabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.padding(150, 0, 0, 0)
      label.font = UIFont(name:"Montserrat-Bold", size: 20.0)
      label.textAlignment = .center
      label.textColor =  UIColor(hexString: "#FFFFFF")
      label.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
  
  static func styleDescriptionLabel(_ label: UILabel, with text: String?) {
    label.text = text
    label.numberOfLines = 0
    label.font = UIFont(name:"Montserrat-Bold", size: 20.0)
    label.textColor =  UIColor(hexString: "#FFFFFF")
    label.textAlignment = .center
  }
    
    static func styleSmalltext(_ label: UILabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.font = UIFont(name:"Montserrat-Regular", size: 14.0)
      label.frame = CGRect(x: 0, y: label.frame.size.height - 1, width: label.frame.size.width, height: 1)
      label.textColor =  UIColor(hexString: "#FFFFFF")
      label.textAlignment = .center
    }
  
  static func styleButton(_ button: UIButton) {
    button.backgroundColor = .white
    button.setTitle("Next", for: .normal)
    button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 18.0)
    button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    button.layer.cornerRadius = 8
  }
    static func styleButtonMain(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Verify", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 18.0)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
    }
    
    static func styleButtonKlapz(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Give this summary: 2 Klapz", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 18.0)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
    }
    
    static func styleButtonDownload(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Download Klapz", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 18.0)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
    }
}

class PaddingLabel: UILabel {
    
    var insets = UIEdgeInsets.zero
    
    /// Добавляет отступы
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}

