//
//  ExampleBottomSheetView.swift
//  BottomSheetExample
//
//  Created by Gaetano Matonti on 22/11/20.
//

import UIKit
import MultilineTextField
import NKVPhonePicker
import CountryPickerView
import FontBlaster
public class ExampleBottomSheetView: UIView {
  
  // MARK: - UI Elements
  
  let titleLabel = UILabel()

  let descibelable = UILabel()
  let X = PaddingLabel()
  let goldBorderedUIView = UIView()
  let descriptionLabel = UILabel()
  let descriptionLabelOTP = UILabel()
  let resend = PaddingLabel()
    let descriptionName = UILabel()
  let errobutton = UIButton(type: .system)
    let errobutton2 = UIButton(type: .system)
    var spinner = UIActivityIndicatorView(style : .whiteLarge)
    var loadingView: UIView = UIView()
    let thnxtext = PaddingLabel()
    var KlapzCount = "2"
     var KlapzBalance = 1000
    let congrasulaiton = PaddingLabel()
    let spacePad = PaddingLabel()
    let frinds = PaddingLabel()
  let borderUI = CALayer()
  var bottomTextField = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 30.00))
  var NameField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
  var text = ""
  var OTPField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
  var KlapzField: UITextField = UITextField();
  let button = UIButton(type: .system)
    let containerView = UIView(frame: CGRect(x:0,y:0,width:120,height:120))
    
    let myImageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00))
    let logowhite:UIImageView = UIImageView()
    let offer:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00))
    let offerbuytton = UIButton(type: .system)
    let buttonverify = UIButton(type: .system)
    var textFieldmulti = MultilineTextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 150.00))
    let titlerclab = UILabel()
    let balanceKlapz = UILabel()
    let buttonklapz = UIButton(type: .system)
    let DownloadKlapz = UIButton(type: .system)
    var Klapxexpretion: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 150.00));
    let defaults = UserDefaults.standard
    let giveklapxtext = UILabel()
    let buttonName = UIButton(type: .system)
    let getnotify = UILabel()
    let termandconditopn = PaddingLabel()
    let maintitletext = PaddingLabel()
    let happytogo = UIButton(type: .system)
    let errortext = PaddingLabel()
    let errortextmain = PaddingLabel()
    var token = ""
//    let UIViewController =
    let textField = TextFieldWithPadding(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
    
    var KlapzConfig: [String: Any] = [
        "key":"xxx",
        "PreferKlapz":"10,20,30",
    ]
    var KlapxUrl = "https://dev.klapz.club/"
    var KlapzresMain: (_ Klapxres : [String: Any]) -> Bool = { _ in return false  }
    
   
    
    public func SetLissner(KlapzRes: @escaping ([String: Any]) -> Bool){
        KlapzresMain = KlapzRes
    }
    
    public func StartKlapz(Config:[String:Any]) {
        KlapzConfig = Config
        print(Config)
        ExampleBottomSheetView.styleTitleLabelContent(
                titlerclab,
                with: KlapzConfig["title"] as! String
        )
        if(KlapzConfig["Envirment"] as! String == "Production"){
                 KlapxUrl = "https://klapz.club/"
        }
        KlapzField.text = String(KlapzConfig["klapz"] as! Int)
        KlapzCount = String(KlapzConfig["klapz"] as! Int)
        if(token != ""){
            UserDetails()
        }
        print("Call api")
        print(KlapzConfig)
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
        stack.spacing   = 16.0
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
  //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()
    
      lazy var contentStack: UIStackView = {
        let containerViewtext = UIView(frame: CGRect(x:0,y:0,width:50,height:50))

        

        
        bottomTextField.textColor = UIColor(hexString: "#FFFFFF")
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))//
        let stacktest = UIStackView(arrangedSubviews: [paddingView,bottomTextField])
        stacktest.axis = .horizontal
        stacktest.spacing = 16
        stacktest.alignment = .fill
        stacktest.distribution = .fillProportionally
        stacktest.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = stacktest

        textField.leftViewMode = .always
        let stack = UIStackView(arrangedSubviews: [Header,descriptionLabel,descibelable,textField,errortext, button,spinner])
        stack.axis = .vertical
        stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
        return stack
      }()
    
    
    
    lazy var contentStackotp: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [Header , descriptionLabelOTP,OTPField,errortextmain,resend,buttonverify,spinner])
      stack.axis = .vertical
      stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()
    
    lazy var contentStackName: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionName,NameField,errortextmain,buttonName,spinner])
      stack.axis = .vertical
      stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()
    
    lazy var contentStackOffer: UIStackView = {
        
        let catImage3 = UIImage(named: "offerrs.png", in: Bundle.module, compatibleWith: nil)
        let containerViewtext1 = UIView(frame: CGRect(x:0,y:0,width:50,height:50))
        var loginrto1 = UIImageView()
        containerViewtext1.addSubview(loginrto1)
        loginrto1.contentMode = UIView.ContentMode.scaleAspectFit
        loginrto1.frame.size = CGSize(width: 200, height: 200)
        loginrto1.frame.size.width = 200
        loginrto1.frame.size.height = 200
        loginrto1.image = catImage3
        loginrto1.center = containerViewtext1.center
        loginrto1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        loginrto1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        var spacela1 = PaddingLabel()
        spacela1.text = ""
        spacela1.numberOfLines = 0
        spacela1.padding(30, 0, 0, 0)
        
      let stack = UIStackView(arrangedSubviews: [Header , congrasulaiton  ,spacela1,spacela1, loginrto1,spacela1,spacela1, offerbuytton])
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
       
        var array :String
        array = "10,20,30"
        var arry2 = array.components(separatedBy: ",")
        var arrayOfButtons: [UIButton] = []
        for value in arry2 {
            let button = UIButton(type: .system)
            button.backgroundColor = .white
            button.setTitle(value, for: .normal)
            button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 16.0)
            button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
            button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            button.layer.cornerRadius =  27
            button.tag = Int(value) ?? 10
            button.heightAnchor.constraint(equalToConstant: 55).isActive = true
            button.widthAnchor.constraint(equalToConstant: 55).isActive = true
            button.addConstraint(button.heightAnchor.constraint(equalToConstant: 55))
            button.addConstraint(button.widthAnchor.constraint(equalToConstant: 55))
            button.addTarget(self, action:#selector(Preferklapz(_:)), for: .touchUpInside)
            arrayOfButtons.append(button)
        }
        let containerView = UIView(frame: CGRect(x:0,y:0,width:0,height:120))
        containerView.addSubview(myImageView)
        myImageView.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        Klapzview.center = goldBorderedUIView.convert(goldBorderedUIView.center, from: goldBorderedUIView);
        
        let containerViewiomage = UIView(frame: CGRect(x:0,y:0,width:56,height:56))
        containerViewiomage.addSubview(myImageView)
        containerViewiomage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        containerViewiomage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        let catImage2 = UIImage(named: "klapzicon.png", in: Bundle.module, compatibleWith: nil)
        let containerViewtext = UIView(frame: CGRect(x:0,y:0,width:50,height:50))
        var loginrto = UIImageView()
        containerViewtext.addSubview(loginrto)
        loginrto.contentMode = UIView.ContentMode.scaleAspectFit
        loginrto.frame.size = CGSize(width: 50, height: 50)
        loginrto.frame.size.width = 50
        loginrto.frame.size.height = 50
        loginrto.image = catImage2
        containerViewtext.addSubview(loginrto)
        containerViewtext.addConstraint(containerViewtext.heightAnchor.constraint(equalToConstant: 50))
        containerViewtext.addConstraint(containerViewtext.widthAnchor.constraint(equalToConstant: 50))
        
        let stackmain = UIStackView(arrangedSubviews: [[containerViewtext,X],arrayOfButtons,[KlapzField]].reduce([], +))
        stackmain.spacing   = 12
        stackmain.axis = .horizontal
        stackmain.translatesAutoresizingMaskIntoConstraints = false
        stackmain.distribution = .fill
        stackmain.alignment = .center
        goldBorderedUIView.addSubview(stackmain)
        goldBorderedUIView.translatesAutoresizingMaskIntoConstraints = false
        goldBorderedUIView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        

//        goldBorderedUIView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
//        goldBorderedUIView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10.0).isActive = true
//        goldBorderedUIView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0).isActive = true
        

        stackmain.centerXAnchor.constraint(equalTo: goldBorderedUIView.centerXAnchor).isActive = true
        stackmain.centerYAnchor.constraint(equalTo: goldBorderedUIView.centerYAnchor).isActive = true
        
           if (stackmain.subviews.count % 2) == 0 {
                goldBorderedUIView.widthAnchor.constraint(equalToConstant: 100).isActive = true
               } else {
                goldBorderedUIView.widthAnchor.constraint(equalToConstant: 170).isActive = true
           }
        var spacela = PaddingLabel()
        spacela.text = ""
        spacela.numberOfLines = 0
        spacela.padding(10, 0, 0, 0)
        
        var spacela1 = PaddingLabel()
        spacela1.text = ""
        spacela1.numberOfLines = 0
        spacela1.padding(4, 0, 0, 0)
        
        var spacela2 = PaddingLabel()
        spacela2.text = ""
        spacela2.numberOfLines = 0
        spacela2.padding(10, 0, 0, 0)
        
        var paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        
        let cb = Checkbox(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        cb.checkmarkStyle = .tick
        cb.backgroundColor = UIColor(hexString: "#FFFFFF")
        cb.uncheckedBorderColor = UIColor(hexString: "#FFFFFF")
        cb.checkedBorderColor = UIColor(hexString: "#FFFFFF")
        cb.checkmarkColor = UIColor(hexString: "#ff946d")
        cb.isChecked = true
        
        let containerViewtext1 = UIView()
        containerViewtext1.addSubview(cb)
        frinds.addConstraint(frinds.heightAnchor.constraint(equalToConstant: 40))
        containerViewtext1.addConstraint(containerViewtext1.heightAnchor.constraint(equalToConstant: 20))
        let stacktest1 = UIStackView(arrangedSubviews: [containerViewtext1,frinds])
        frinds.numberOfLines = 2
        stacktest1.axis = .horizontal
//        stacktest1.spacing = -45
        stacktest1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stacktest1.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        stacktest1.addConstraint(stacktest1.heightAnchor.constraint(equalToConstant: 40))
//        stacktest1.addConstraint(stacktest1.widthAnchor.constraint(equalToConstant: 40))
        stacktest1.alignment = .center
        stacktest1.distribution = .fillProportionally
        stacktest1.translatesAutoresizingMaskIntoConstraints = false
        
        let stack = UIStackView(arrangedSubviews: [Header , titlerclab,textFieldmulti,spacela,goldBorderedUIView,spacela1,balanceKlapz,paddingView,stacktest1,buttonklapz,errobutton2,spacela2,errortextmain,errobutton])
      stack.axis = .vertical
      stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()

    
    lazy var IntroStack: UIStackView = {
        let catImage2 = UIImage(named: "noti.png", in: Bundle.module, compatibleWith: nil)
        let containerViewtext = UIView(frame: CGRect(x:0,y:0,width:50,height:50))
        
        var loginrto = UIImageView()
        containerViewtext.addSubview(loginrto)
        loginrto.contentMode = UIView.ContentMode.scaleAspectFit
        loginrto.frame.size = CGSize(width: 25, height: 25)
        loginrto.frame.size.width = 25
        loginrto.frame.size.height = 25
        loginrto.image = catImage2
        containerViewtext.addSubview(loginrto)
        containerViewtext.addConstraint(containerViewtext.heightAnchor.constraint(equalToConstant: 25))
        containerViewtext.addConstraint(containerViewtext.widthAnchor.constraint(equalToConstant: 25))
        
        let stacktest = UIStackView(arrangedSubviews: [containerViewtext,getnotify])
        stacktest.axis = .horizontal
        stacktest.spacing = 16
        stacktest.alignment = .fill
        stacktest.distribution = .fillProportionally
        stacktest.translatesAutoresizingMaskIntoConstraints = false
        
        
        let catImage3 = UIImage(named: "klap2.png", in: Bundle.module, compatibleWith: nil)
        let containerViewtext1 = UIView(frame: CGRect(x:0,y:0,width:50,height:50))
        var loginrto1 = UIImageView()
        containerViewtext1.addSubview(loginrto1)
        containerViewtext1.addConstraint(containerViewtext1.heightAnchor.constraint(equalToConstant: 25))
        containerViewtext1.addConstraint(containerViewtext1.widthAnchor.constraint(equalToConstant: 25))
        loginrto1.contentMode = UIView.ContentMode.scaleAspectFit
        loginrto1.frame.size = CGSize(width: 30, height: 30)
        loginrto1.frame.size.width = 30
        loginrto1.frame.size.height = 30
        loginrto1.image = catImage3
        let stacktest1 = UIStackView(arrangedSubviews: [containerViewtext1,giveklapxtext])
        stacktest1.axis = .horizontal
        stacktest1.spacing = 16
        stacktest1.alignment = .fill
        stacktest1.distribution = .fillProportionally
        stacktest1.translatesAutoresizingMaskIntoConstraints = false
        
        
      let stack = UIStackView(arrangedSubviews: [containerView,maintitletext,stacktest1,stacktest,termandconditopn,happytogo])
      stack.axis = .vertical
      stack.spacing = 16
  //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()
    
  // MARK: - Init
  
public override init(frame: CGRect) {
    super.init(frame: frame)
    print("======asdasasdasd=====")
    print(KlapzConfig)
    let name = defaults.string(forKey: "token")
    if(name != nil){
        token = name ?? ""
    }
    
    FontBlaster.blast(bundle: .module)
    
    self.textField.placeholder = "Enter phone number"
//    self.textField.withFlag = true
//    self.textField.withPrefix = true
    let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    textField.frame = textField.frame.inset(by: UIEdgeInsets(top: .zero, left: 5.0, bottom: 5.0, right: .zero))
    textField.attributedPlaceholder = NSAttributedString(string: "Enter phone number",
                                attributes: [NSAttributedString.Key.foregroundColor:UIColor(hexString: "#FFFFFF")])
    textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: 56))
    self.textField.textColor =  UIColor(hexString: "#FFFFFF")
    self.OTPField.tintColor =  UIColor(hexString: "#CCCCCC")
    textField.backgroundColor = UIColor(hexString: "#ff946d")
    textField.layer.cornerRadius = 10
    errortextmain.isHidden = true
    textField.keyboardType = .numberPad
    
    self.OTPField.placeholder = "Enter Code"
    self.OTPField.isSecureTextEntry = true
    OTPField.frame = OTPField.frame.inset(by: UIEdgeInsets(top: .zero, left: 10, bottom: 5.0, right: .zero))
    OTPField.addConstraint(OTPField.heightAnchor.constraint(equalToConstant: 56))
    self.OTPField.textColor =  UIColor(hexString: "#ffffff")
    OTPField.keyboardType = .numberPad
    OTPField.attributedPlaceholder = NSAttributedString(string: "Enter Code",
                                attributes: [NSAttributedString.Key.foregroundColor:UIColor(hexString: "#FFFFFF")])
    self.OTPField.tintColor =  UIColor(hexString: "#CCCCCC")
    OTPField.backgroundColor = UIColor(hexString: "#ff946d")
    OTPField.layer.cornerRadius = 10
   
    OTPField.leftView = paddingView
    OTPField.leftViewMode = .always
    
    self.NameField.placeholder = "Enter Name"
    NameField.frame = NameField.frame.inset(by: UIEdgeInsets(top: .zero, left: 10, bottom: 5.0, right: .zero))
    NameField.addConstraint(NameField.heightAnchor.constraint(equalToConstant: 56))
    self.NameField.textColor =  UIColor(hexString: "#ffffff")
    NameField.keyboardType = .default
    NameField.attributedPlaceholder = NSAttributedString(string: "Enter Name",
                                attributes: [NSAttributedString.Key.foregroundColor:UIColor(hexString: "#FFFFFF")])
    self.NameField.tintColor =  UIColor(hexString: "#CCCCCC")
    NameField.backgroundColor = UIColor(hexString: "#ff946d")
    NameField.layer.cornerRadius = 10
   
    NameField.leftView = paddingView
    NameField.leftViewMode = .always
    
//    self.Klapxexpretion.placeholder = "Tell us, what do you love about this book summary"
//    self.Klapxexpretion.tintColor =  UIColor(hexString: "#CCCCCC")
    Klapxexpretion.frame = Klapxexpretion.frame.inset(by: UIEdgeInsets(top: .zero, left: 5.0, bottom: 5.0, right: .zero))
    Klapxexpretion.attributedPlaceholder = NSAttributedString(string: "  Tell us, what do you love about this book summary",
                                attributes: [NSAttributedString.Key.foregroundColor:UIColor(hexString: "#FFFFFF")])
    Klapxexpretion.leftView = paddingView
    Klapxexpretion.leftViewMode = .always
    Klapxexpretion.addConstraint(Klapxexpretion.heightAnchor.constraint(equalToConstant: 120))
    self.Klapxexpretion.textColor =  UIColor(hexString: "#FFFFFF")
    Klapxexpretion.backgroundColor = UIColor(hexString: "#ff946d")
    Klapxexpretion.layer.cornerRadius = 10
    
    
    self.KlapzField.placeholder = ""
    KlapzField.frame = KlapzField.frame.inset(by: UIEdgeInsets(top: .zero, left: 5.0, bottom: 5.0, right: .zero))
    KlapzField.addConstraint(KlapzField.heightAnchor.constraint(equalToConstant: 55))
    KlapzField.addConstraint(KlapzField.widthAnchor.constraint(equalToConstant: 55))
    self.KlapzField.textColor =  UIColor(hexString: "#ffffff")
    KlapzField.textAlignment = .center
    KlapzField.backgroundColor = UIColor(hexString: "#ff946d")
    KlapzField.layer.cornerRadius = 10
    KlapzField.text = "2"
    KlapzField.keyboardType = .numberPad
    
    self.Header.layer.borderWidth = 0
    self.Header.layer.borderColor = UIColor(hexString: "#000000").cgColor
    self.Header.layer.frame = CGRect(x: 0, y: self.Header.frame.size.height - 1, width: self.Header.frame.size.width, height: 1)
    button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    buttonverify.addTarget(self, action: #selector(buttonVerifyClicked), for: .touchUpInside)
    buttonName.addTarget(self, action: #selector(buttonNameClicked), for: .touchUpInside)
    buttonklapz.addTarget(self, action: #selector(buttonVerifyKlapz), for: .touchUpInside)
    happytogo.addTarget(self, action: #selector(buttonhappy), for: .touchUpInside)
    offerbuytton.addTarget(self, action: #selector(offerbuyttonclick), for: .touchUpInside)
    DownloadKlapz.addTarget(self, action: #selector(DownloadKlapzClick), for: .touchUpInside)
    errobutton2.addTarget(self, action: #selector(DownloadKlapzClick), for: .touchUpInside)
    
    setup()
    showActivityIndicator()
    self.spinner.isHidden = true
    KlapzField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    
    
    let catImage = UIImage(named: "klapzicon.png",in: Bundle.module, compatibleWith: nil)
    
    myImageView.contentMode = UIView.ContentMode.scaleAspectFit
    myImageView.image = catImage
    
    
    let catImage2 = UIImage(named: "wihteklapz.png", in: Bundle.module, compatibleWith: nil)
    logowhite.contentMode = UIView.ContentMode.scaleAspectFit
    logowhite.frame.size = CGSize(width: 54, height: 54)
    logowhite.image = catImage2
    containerView.addSubview(logowhite)
    style()
   
    textFieldmulti.placeholder = "  Tell us, what do you love about this book summary"
    textFieldmulti.placeholderColor =  UIColor(hexString: "#ffffff")
    textFieldmulti.isPlaceholderScrollEnabled = true
    
    var spacela1 = PaddingLabel()
    spacela1.text = "  "
    spacela1.numberOfLines = 0
    spacela1.padding(0, 0,10, 10)
    var paddingViespace: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0 ))
    textFieldmulti.leftView = paddingViespace
    textFieldmulti.textContainer.lineFragmentPadding = CGFloat(10)
    textFieldmulti.font  = UIFont(name:"Montserrat-Regular", size: 14.0)
    textFieldmulti.addConstraint(textFieldmulti.heightAnchor.constraint(equalToConstant: 120))
    self.textFieldmulti.textColor =  UIColor(hexString: "#FFFFFF")
    textFieldmulti.backgroundColor = UIColor(hexString: "#ff946d")
    textFieldmulti.layer.cornerRadius = 10
    
    
    bottomTextField.backgroundColor = UIColor(hexString: "#ff946d")
    bottomTextField.showCountryCodeInView = false
//    let countryController = CountryPickerWithSectionViewController.presentController(on: self)
//    bottomTextField = NKVPhonePickerTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
//    bottomTextField.phonePickerDelegate = self.getOwningViewController()
//    bottomTextField.countryPickerDelegate = self
//    bottomTextField.favoriteCountriesLocaleIdentifiers = ["RU", "ER", "JM"]
//    let country = Country.country(for: NKVSource(countryCode: "RU"))
//    bottomTextField.country = country
//    let source = NKVSource(countryCode: "ru")
//    bottomTextField.setCurrentCountryInitially = false
//    bottomTextField.preFillText(source: source, number: 7999432423)
////     Setting to let the flag be changed only with code
//    bottomTextField.isFlagFixed = true
//    // Setting custom format pattern for some countries
//    bottomTextField.customPhoneFormats = ["IN": "## #### #########"]
    if(token != ""){
        ExampleBottomSheetView.styleTitleLabel(
          titleLabel,
          with: "Klapz Club"
        )
    }
  }
  
    func getOwningViewController() -> UIViewController? {
      var nextResponser = self
      while let next = nextResponser.next {
        nextResponser = next as! ExampleBottomSheetView
        if let viewController = nextResponser as? UIViewController {
          return viewController
        }
      }
      return nil
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        var a: Int? = Int(KlapzField.text ?? "2")
        KlapzCount = textField.text ?? "2"
        buttonklapz.setTitle("Give " + KlapzCount + " Klapz", for: .normal)
        
        if(textField.text != ""){
            if(a! > KlapzBalance){
//                ExampleBottomSheetView.styleSmalltexterror(
//                  errortextmain,
//                  with: "You have only 0 claps left. Can't contribute 2 claps"
//                )
//                errortextmain.isHidden = false
                errobutton2.isHidden = false
                buttonklapz.isHidden = true
            }else{
                errobutton2.isHidden = true
                buttonklapz.isHidden = false
            }
        }
       
    }
    
    @objc func buttonClicked() {
//        setupOtp()
//        print(bottomTextField.selectedCountry.phoneCode)
        if(textField.text == "1234567890" || textField.text == "" || textField.text?.count != 10 ){
            ExampleBottomSheetView.styleSmalltexterror(
              errortext,
              with: "Please enter a valid mobile number"
            )
            errortext.isHidden = false
            
//            setupOtp()

  
        }else{
            Loginapi()

        }
        print(String(textField.text ?? "asd"))
    }
    private func ErroKlapShow(errorMessage: String) {
//      ExampleBottomSheetView.styleViewwhite(self)
        ExampleBottomSheetView.styleSmalltexterrorstateerror(
          errortextmain,
          with: errorMessage
        )
        errortextmain.isHidden = false
    }
    
    func Loginapi() {
        DispatchQueue.main.async {
            self.spinner.isHidden = false
            self.button.isHidden = true
        }
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        print(bottomTextField.selectedCountry)
        let mobile = (bottomTextField.selectedCountry.phoneCode as String) + textField.text! ?? ""
        let params = ["user":["mobile": mobile]] as Dictionary<String, AnyObject>
        print(params)
        let urlString = NSString(format: KlapxUrl + "auth/request_mobile_otp?apiKey="+(KlapzConfig["key"] as! String)+"&apiFrom=ios&buildNumber=3" as NSString);
            print("url string is \(urlString)")
            let request : NSMutableURLRequest = NSMutableURLRequest()
            request.url = NSURL(string: NSString(format: "%@", urlString)as String) as URL?
            request.httpMethod = "POST"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])

     
        let dataTask = session.dataTask(with: request as URLRequest)
        { [self]
                    (data: Data?, response: URLResponse?, error: Error?) -> Void in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                    else {
                            print("error: not a valid http response ========")
                            DispatchQueue.main.async {
                                self.spinner.isHidden = true
                                self.button.isHidden = false
                            }
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:

                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        print("save profile POST request got response")
                        DispatchQueue.main.async {
                            self.errortext.isHidden = true // show
                            self.setupOtp()
                        }
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            self.button.isHidden = false
                        }
                        print(response)

                    default:
                        DispatchQueue.main.async {
                            ExampleBottomSheetView.styleSmalltexterror(
                              self.errortext,
                              with: "Please enter a valid mobile number"
                            )
                            self.errortext.isHidden = false
                        }
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            self.button.isHidden = false
                        }
                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        print("save profile POST request got error response \(response)")
                    }
            }
            dataTask.resume()
        
    }
    
    
    func OTPVefify(otp : String) {
        DispatchQueue.main.async {
            self.spinner.isHidden = false
            self.buttonverify.isHidden = true
        }
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        print(bottomTextField.selectedCountry)
        let mobile = (bottomTextField.selectedCountry.phoneCode as String) + textField.text! ?? ""
        let params = ["user":["mobile": mobile,"otp":otp]] as Dictionary<String, AnyObject>
        print(params)
        let urlString = NSString(format: KlapxUrl + "auth/verify_mobile_otp.json?apiKey="+(KlapzConfig["key"] as! String)+"&apiFrom=ios&buildNumber=3" as NSString);
            print("url string is \(urlString)")
            let request : NSMutableURLRequest = NSMutableURLRequest()
            request.url = NSURL(string: NSString(format: "%@", urlString)as String) as URL?
            request.httpMethod = "POST"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])

     
        let dataTask = session.dataTask(with: request as URLRequest)
        { [self]
                    (data: Data?, response: URLResponse?, error: Error?) -> Void in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                    else {
                            print("error: not a valid http response ========")
                            DispatchQueue.main.async {
                                self.spinner.isHidden = true
                                self.buttonverify.isHidden = false
                            }
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:
                        token = httpResponse.allHeaderFields["auth-token"] as! String
                        defaults.set(token, forKey: "token")
                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        print("save profile POST request got response")
                        let json = try? JSONSerialization.jsonObject(with: receivedData) as! Dictionary<String, AnyObject>

                        let userTemp = json?["user"] as? Dictionary<String, AnyObject>;
                        var onboardingComplete = userTemp?["onboardingComplete"] as! Bool
                        print("Asdasdasdasd",onboardingComplete)
                        if(onboardingComplete != true){
                            let name = json?["offer"];
                            if(name != nil){
                                defaults.set("offer", forKey: "offer")
                            }
                            
                            defaults.set("false", forKey: "onboardingComplete")
                            DispatchQueue.main.async {
                                self.errortextmain.isHidden = true // show
                                self.setupName()
                            }
                        }else{
                            defaults.set("true", forKey: "onboardingComplete")
                            let name = json?["offer"];
                            if(name != nil){
                                    DispatchQueue.main.async {
                                        self.errortextmain.isHidden = true // show
                                        self.setupOffer()
                                    }
                            }else{
                                DispatchQueue.main.async {
                                        self.contentStackotp.removeFromSuperview()
                                        self.setupKlapz()
                                }
                            }
                        }
                        
          
                        DispatchQueue.main.async {
                            ErroKlapShow(errorMessage: "")
                        }
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            self.buttonverify.isHidden = false
                        }
                        
                        print(json?["user"] as? Dictionary<String, AnyObject>)
                        var user = json?["user"] as? Dictionary<String, AnyObject>
                        print(user?["balanceClaps"] as! Int)
                        var couts = user?["balanceClaps"] as! Int
                        KlapzBalance = couts
                        DispatchQueue.main.async {
                            ExampleBottomSheetView.styleSmallcount(
                             balanceKlapz,
                                with: "Your Klapz balance: " +  String(couts)
                            )
                        }
                        UserDetails()
                    default:
                        DispatchQueue.main.async {
                            ExampleBottomSheetView.styleSmalltexterror(
                              errortextmain,
                              with: "Please enter a valid code"
                            )
                            self.errortextmain.isHidden = false
                        }
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            self.buttonverify.isHidden = false
                        }
                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        print("save profile POST request got error response \(response)")
                    }
            }
            dataTask.resume()
        
    }
    
    
    func NameVefify(name : String) {
        DispatchQueue.main.async {
            self.spinner.isHidden = false
            self.buttonName.isHidden = true
        }
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        print(bottomTextField.selectedCountry)
        let mobile = (bottomTextField.selectedCountry.phoneCode as String) + textField.text! ?? ""
        let params = ["user":["firstName":name]] as Dictionary<String, AnyObject>
        print(params)
        let urlString = NSString(format: KlapxUrl + "user/profile?apiKey=kuaduekwamk1ah&apiFrom=ios&buildNumber=3" as NSString);
            print("url string is \(urlString)")
            let request : NSMutableURLRequest = NSMutableURLRequest()
            request.url = NSURL(string: NSString(format: "%@", urlString)as String) as URL?
            request.httpMethod = "POST"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(token, forHTTPHeaderField: "auth-token")
            request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])

     
        let dataTask = session.dataTask(with: request as URLRequest)
        { [self]
                    (data: Data?, response: URLResponse?, error: Error?) -> Void in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                    else {
                            print("error: not a valid http response ========")
                            DispatchQueue.main.async {
                                self.spinner.isHidden = true
                                self.buttonName.isHidden = false
                            }
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:
                        print("save profile POST request got response \(response)")
                        defaults.set("true", forKey: "onboardingComplete")
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            self.buttonName.isHidden = false
                        }
                        let name = defaults.string(forKey: "offer")
                        if(name != nil){
                                DispatchQueue.main.async {
                                    self.errortextmain.isHidden = true // show
                                    self.contentStackName.removeFromSuperview()
                                    self.setupOffer()
                                }
                        }else{
                            DispatchQueue.main.async {
                                    self.contentStackName.removeFromSuperview()
                                    self.contentStackotp.removeFromSuperview()
                                    self.setupKlapz()
                            }
                        }

                    default:
                        DispatchQueue.main.async {
                            ExampleBottomSheetView.styleSmalltexterror(
                              errortextmain,
                              with: "Please enter a valid Name"
                            )
                            self.errortextmain.isHidden = false
                        }
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            self.buttonName.isHidden = false
                        }
                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        print("save profile POST request got error response \(response)")
                    }
            }
            dataTask.resume()
        
    }
    
    
    func Klapz() {
        DispatchQueue.main.async {
            self.spinner.isHidden = false
            self.buttonklapz.isHidden = true
        }
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        var params = ["claps":"claps"] as Dictionary<String, AnyObject>
        if(KlapzConfig["Url"] != nil){
            params = ["claps":[
                "count":KlapzCount,
                "title":  KlapzConfig["title"] as! String,
                "public": true,
                "Key": (KlapzConfig["key"] as! String),
                "fromWhere": "externalApp",
                "expression": Klapxexpretion.text,
                "contentURL":  KlapzConfig["Url"] as! String,
                
                ]] as Dictionary<String, AnyObject>
        }else{
            params = ["claps":[
                "count":KlapzCount,
                "title":  KlapzConfig["title"] as! String,
                "public": true,
                "Key": (KlapzConfig["key"] as! String),
                "fromWhere": "externalApp",
                "expression": Klapxexpretion.text,
                
                "description":  KlapzConfig["description"] as! String,
                "contentId":  KlapzConfig["contentId"] as! String,
                "creatorId":  KlapzConfig["creatorId"] as! String,
                "creatorName":  KlapzConfig["creatorName"] as! String,
                "creatorScreenName":  KlapzConfig["creatorScreenName"] as! String,
                "tags":  KlapzConfig["tags"] as! String,
                "ContentType":  KlapzConfig["ContentType"] as! String,
                
                ]] as Dictionary<String, AnyObject>
        }
   
        print(params)
        let urlString = NSString(format: KlapxUrl + "claps/expend?apiKey="+(KlapzConfig["key"] as! String)+"&apiFrom=ios&buildNumber=3" as NSString);
            print("url string is \(urlString)")
            print(token)
            let request : NSMutableURLRequest = NSMutableURLRequest()
            request.url = NSURL(string: NSString(format: "%@", urlString)as String) as URL?
            request.httpMethod = "POST"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(token, forHTTPHeaderField: "auth-token")
            request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])

     
        let dataTask = session.dataTask(with: request as URLRequest)
        { [self]
                    (data: Data?, response: URLResponse?, error: Error?) -> Void in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                    else {
                            print("error: not a valid http response ========")
                            print(response)
                            DispatchQueue.main.async {
                                self.spinner.isHidden = true
                                self.buttonklapz.isHidden = false
                            }
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            self.buttonklapz.isHidden = false
                        }
                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        print("save profile POST request got response")
                        let json = try? JSONSerialization.jsonObject(with: receivedData) as! Dictionary<String, AnyObject>

                        let name = json?["offer"];
                        DispatchQueue.main.async {
                                self.setupKlapzContent()
                               KlapzresMain(params)
                        }
                        print(json?["user"] as? Dictionary<String, AnyObject>)

                    default:
                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        DispatchQueue.main.async {
                            ErroKlapShow(errorMessage: "You have no Klapz left in your account. Please, buy some more Klapz.")
                        }
                        DispatchQueue.main.async {
                            self.spinner.isHidden = true
                            self.buttonklapz.isHidden = false
                        }
                        print("save profile POST request got error response \(response)")
                    }
            }
            dataTask.resume()
        
    }
    
    
    
    func Logout()  {
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        var params = ["claps":"claps"] as Dictionary<String, AnyObject>
        params = ["claps":""] as Dictionary<String, AnyObject>
   
        print(params)
        let urlString = NSString(format: KlapxUrl + "auth/logout" as NSString);
            print("url string is \(urlString)")
            print(token)
            let request : NSMutableURLRequest = NSMutableURLRequest()
            request.url = NSURL(string: NSString(format: "%@", urlString)as String) as URL?
            request.httpMethod = "GET"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
             request.addValue(token, forHTTPHeaderField: "auth-token")
//            request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])

     
        let dataTask = session.dataTask(with: request as URLRequest)
        { [self]
                    (data: Data?, response: URLResponse?, error: Error?) -> Void in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                    else {
                            print("error: not a valid http response ========")
                            print(response)
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:

                       UserDetails()
                       

                    default:
                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        UserDetails()
                        print("save profile POST request got error response \(response)")
                    }
            }
            dataTask.resume()
        
    }
    func showActivityIndicator() {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = center
            self.loadingView.backgroundColor = UIColor(named: "#444444")
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10

            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            self.loadingView.addSubview(self.spinner)
            self.spinner.startAnimating()
    }
    func UserDetails()  {
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        var params = ["claps":"claps"] as Dictionary<String, AnyObject>
        params = ["claps":""] as Dictionary<String, AnyObject>
   
        print(params)
        let urlString = NSString(format: KlapxUrl + "user/profile?props=balanceClaps&apiFrom=ios&buildNumber=3&apiKey="+(KlapzConfig["key"] as! String)+"" as NSString);
            print("url string is \(urlString)")
            print(token)
            let request : NSMutableURLRequest = NSMutableURLRequest()
            request.url = NSURL(string: NSString(format: "%@", urlString)as String) as URL?
            request.httpMethod = "GET"
            request.timeoutInterval = 30
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(token, forHTTPHeaderField: "auth-token")
            print("url string is \(urlString)")
            print(token)
//            request.httpBody  = try! JSONSerialization.data(withJSONObject: params, options: [])

     
        let dataTask = session.dataTask(with: request as URLRequest)
        { [self]
                    (data: Data?, response: URLResponse?, error: Error?) -> Void in
                    // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? HTTPURLResponse, let receivedData = data
                    else {
                            print("error: not a valid http response ========")
                            print(response)
                            return
                    }

                    switch (httpResponse.statusCode)
                    {
                    case 200:

                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        print("save profile POST request got response")
                        let json = try? JSONSerialization.jsonObject(with: receivedData) as! Dictionary<String, AnyObject>
                        print(json)
                        var user = json?["user"] as? Dictionary<String, AnyObject>
                        print("======================balanceClaps==================================")
                        print(user?["balanceClaps"] as! Int)
                        var couts = user?["balanceClaps"] as! Int
                        KlapzBalance = couts
                        DispatchQueue.main.async {
                            ExampleBottomSheetView.styleSmallcount(
                             balanceKlapz,
                                with: "Your Klapz balance: " +  String(couts)
                            )
                        }

                    default:
                        let response = NSString (data: receivedData, encoding: String.Encoding.utf8.rawValue)
                        defaults.set("", forKey: "token")
                        token = ""
                        DispatchQueue.main.async {
                            contentStackKlapz.removeFromSuperview()
                            setupbuttonhappy()
                        }
                        UserDefaults.standard.removeObject(forKey: "token")
                        DispatchQueue.main.async {
                              
                            
//                            contentStackKlapz.removeFromSuperview()
//                            addSubview(IntroStack)
//                            KlapzresMain(params)
                        }
                        print("save profile POST request got error response \(response)")
                    }
            }
            dataTask.resume()
        
    }
    
    
    
    @objc func buttonVerifyClicked() {
        if(OTPField.text?.count != 4 || OTPField.text == ""){
            ExampleBottomSheetView.styleSmalltexterror(
              errortextmain,
              with: "Please enter a valid code"
            )
            errortextmain.isHidden = false // show
        }else{
            OTPVefify(otp: OTPField.text! ?? "1111")
//            errortextmain.isHidden = true // show
//            setupOffer()
        }
        
        print(String(OTPField.text ?? "asd"))
    }
    @objc func buttonNameClicked() {
        if(NameField.text == ""){
            ExampleBottomSheetView.styleSmalltexterror(
              errortextmain,
              with: "Please enter a valid Name"
            )
            errortextmain.isHidden = false // show
        }else{
            NameVefify(name: NameField.text! ?? "---")
//            errortextmain.isHidden = true // show
//            setupOffer()
        }
        
        print(String(NameField.text ?? "asd"))
    }
    
    
    @objc func buttonVerifyKlapz() {
//        ExampleBottomSheetView.styleSmalltexterror(
//          errortextmain,
//          with: "You have only 0 claps left. Can't contribute 2 claps"
//        )
//        errortextmain.isHidden = false
//        errobutton.isHidden = false
        Klapz()
//        setupKlapzContent()
        print("Call api")
    }
    
    @objc func buttonhappy(){
        setupbuttonhappy()
    }
    @objc func offerbuyttonclick(){
        setupKlapz()
     }
    @objc func DownloadKlapzClick(){
        if let url = URL(string: "itms-apps://itunes.apple.com/app/id1546369266"),
            UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:]) { (opened) in
                if(opened){
                    print("App Store Opened")
                }
            }
        } else {
            print("Can't Open URL on Simulator")
        }
    }
    
    @objc func Preferklapz(_ sender : UIButton) {
        print(sender.tag)
        buttonklapz.setTitle("Give " + String(sender.tag) + " Klapz", for: .normal)
        KlapzField.text = String(sender.tag)
    }
    
    

    
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
    style()
    
  }
  
  // MARK: - SSUL
  
  private func setup() {
    if(token == ""){
        addSubview(IntroStack)
        setConstraintsintro()
    }else{
        
//        Logout()
        
//        addSubview(IntroStack)
//        setConstraintsintro()
//        setupbuttonhappy()
//        setupOtp()
        let onboardingComplete = defaults.string(forKey: "onboardingComplete")
        if(onboardingComplete == "true"){
//            removeFromSuperview()
            setupKlapz()
        }else{
            ExampleBottomSheetView.styleTitleLabel(
              titleLabel,
              with: "A bit about you"
            )
            addSubview(contentStackName)
            setConstraintName()
        }
//        setupKlapz()
    }
    
  }
    
    private func setupOffer() {
        ExampleBottomSheetView.styleTitleLabel(
          titleLabel,
          with: "Klapz Club"
        )
      contentStackotp.removeFromSuperview()
      addSubview(contentStackOffer)
      setConstraintsOffer()
      
    }

    
    private func setupName() {
        ExampleBottomSheetView.styleTitleLabel(
          titleLabel,
          with: "A bit about you"
        )
      contentStackotp.removeFromSuperview()
      addSubview(contentStackName)
      setConstraintName()
      
    }
    
    private func setupbuttonhappy() {
        IntroStack.removeFromSuperview()
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
//            ExampleBottomSheetView.styleTitleLabelContent(
//                titlerclab,
//                with: KlapzConfig["title"] as! String
//          )
      contentStackotp.removeFromSuperview()
        contentStackOffer.removeFromSuperview()
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
    
      ExampleBottomSheetView.styleTitleLabel(
             descriptionName,
           with: "Welcome. What’s your name?"
      )
      
    ExampleBottomSheetView.styleTitleLabelthnx(
        thnxtext,
      with: "Thanks for Klapping."
    )
    ExampleBottomSheetView.styleSmalltext(
     descibelable,
      with: "You will receive a 4 digit code\non this number, by  SMS"
    )
    ExampleBottomSheetView.styleSmalltextx(
     X,
      with: "X"
    )
    ExampleBottomSheetView.styleresend(
     resend,
      with: "Resend"
    )
    
    ExampleBottomSheetView.styleSmallcount(
     balanceKlapz,
      with: "Your Klapz balance: 0"
    )
    ExampleBottomSheetView.styleTitleCongo(
      congrasulaiton,
      with: "Congratulations"
    )
    
    ExampleBottomSheetView.styleSmallStart(
        giveklapxtext,
        with: "Give as little as ₹2 when you like a content."
    )
    ExampleBottomSheetView.styleSmallStartm(
        maintitletext,
        with: "Micro rewarding free content on the internet."
    )

    var myMutableString1 = NSMutableAttributedString(string: "Micro rewarding free content on the internet.\nLearn more", attributes: [NSAttributedString.Key.font :UIFont(name:"Montserrat-Regular", size: 15.0)!])
    let paragraphStyle = NSMutableParagraphStyle()

    // *** set LineSpacing property in points ***
      paragraphStyle.lineSpacing = 2
      let string              = "Micro rewarding free content on the internet.\nLearn more"
      let range               = (string as NSString).range(of: "Learn more")
      myMutableString1.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString1.length))
////     myMutableString1.addAttribute(NSAttributedString.Key.link, value: NSURL(string: "https://dev.klapz.club/")!, range: range)
      myMutableString1.addAttribute(NSAttributedString.Key.underlineStyle, value: NSNumber(value: 1), range: range)
      myMutableString1.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location:45,length:11))
      maintitletext.attributedText = myMutableString1
    
    ExampleBottomSheetView.styleSmallStarttearm(
        termandconditopn,
        with: "* Terms & Conditions"
    )
    
//    var myMutableString = NSMutableAttributedString(string: "* Terms & Conditions apply", attributes: [NSAttributedString.Key.font :UIFont(name:"Montserrat-Regular", size: 15.0)!])
//    myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:1))
//    myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location:21,length:5))
//    termandconditopn.attributedText = myMutableString
    
    ExampleBottomSheetView.styleSmallStart(
      getnotify,
      with: "Get notified when your friends Klap."
    )
    ExampleBottomSheetView.styleSmallFrinds(
        frinds,
      with: "Can we notify your friends about this Klap?"
    )
    
    ExampleBottomSheetView.styleSmalltexterror(
      errortext,
      with: "Please enter a valid Code"
    )
    
    
    
    ExampleBottomSheetView.styleButton(button)
    ExampleBottomSheetView.styleButtonMain(buttonverify)
      ExampleBottomSheetView.styleButtonName(buttonName)
    ExampleBottomSheetView.styleButtonKlapz(buttonklapz)
    ExampleBottomSheetView.styleButtonDownload(DownloadKlapz)
    ExampleBottomSheetView.styleButtonhappy(happytogo)
    ExampleBottomSheetView.styleButtonNuy(errobutton)
    ExampleBottomSheetView.styleButtonNuy(errobutton2)
    ExampleBottomSheetView.styleButtonoffer(offerbuytton)
    errobutton2.isHidden = true
    errobutton.isHidden = true
    errortext.isHidden = true
    
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
    
    func setConstraintsintro() {
      IntroStack.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
  //      contentStack.topAnchor.constraint(equalTo: topAnchor),
        IntroStack.leadingAnchor.constraint(equalTo: leadingAnchor),
        IntroStack.trailingAnchor.constraint(equalTo: trailingAnchor),
  //      contentStack.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])

  //    border.frame = CGRectMake(-1, -1, CGRectGetWidth(leftScrollView.frame), CGRectGetHeight(leftScrollView.frame)+2)
    }
  
    
    func setConstraintsOffer() {
        contentStackOffer.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
  //      contentStack.topAnchor.constraint(equalTo: topAnchor),
        contentStackOffer.leadingAnchor.constraint(equalTo: leadingAnchor),
        contentStackOffer.trailingAnchor.constraint(equalTo: trailingAnchor),
  //      contentStack.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
    }
    func setConstraintName() {
      contentStackName.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
  //      contentStack.topAnchor.constraint(equalTo: topAnchor),
        contentStackName.leadingAnchor.constraint(equalTo: leadingAnchor),
        contentStackName.trailingAnchor.constraint(equalTo: trailingAnchor),
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
  //      contentStack.topAnchor.constraint(equalTo: topAnchor,
        thnxStakl.leadingAnchor.constraint(equalTo: leadingAnchor),
        thnxStakl.trailingAnchor.constraint(equalTo: trailingAnchor),
  //      contentStack.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
        
    }
    
}

// MARK: - Styling Functions

public extension ExampleBottomSheetView {
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
    
    static func styleSmalltexterrorstateerror(_ label: UILabel, with text: String?) {
         label.text = text
         label.numberOfLines = 0
         label.font = UIFont(name:"Montserrat-Regular", size: 14.0)
         label.textColor =  UIColor(hexString: "#ffffff")
         label.textAlignment = .center
       }
    
    static func styleTitleCongo(_ label: PaddingLabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.padding(30, 0, 0, 0)
      label.font = UIFont(name:"Montserrat-Bold", size: 20.0)
      label.textAlignment = .center
      label.textColor =  UIColor(hexString: "#FFFFFF")
      label.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    
    static func styleButtonName(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Save", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Regular", size: 18.0)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
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
      label.font = UIFont(name:"Montserrat-Regular", size: 12.0)
      label.textColor =  UIColor(hexString: "#FFFFFF")
      label.textAlignment = .center
    }
    
    
    static func styleSmalltextx(_ label: PaddingLabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.padding(0, 0, 10, 0)
      label.font = UIFont(name:"Montserrat-Regular", size: 12.0)
      label.textColor =  UIColor(hexString: "#FFFFFF")
      label.textAlignment = .center
    }
    
    
    static func styleSmalltexterror(_ label: PaddingLabel, with text: String?) {
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont(name:"Montserrat-Regular", size: 14.0)
        label.textColor =  UIColor(hexString: "#ffffff")
        label.textAlignment = .center
    }
    
    static func styleSmalltexterrorstate(_ label: UILabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.font = UIFont(name:"Montserrat-Regular", size: 12.0)
      label.textColor =  UIColor(hexString: "#ffffff")
      label.textAlignment = .center
    }
    
    static func styleresend(_ label: PaddingLabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.padding(10, 10, 0, 0)
      label.font = UIFont(name:"Montserrat-Bold", size: 18.0)
      label.textColor =  UIColor(hexString: "#FFFFFF")
        label.textAlignment = .right
    }
  
    static func styleSmallStart(_ label: UILabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.font = UIFont(name:"Montserrat-Regular", size: 15.0)
      label.textColor =  UIColor(hexString: "#FFFFFF")
        label.textAlignment = .left
    }
    
    static func styleSmallStarttearm(_ label: PaddingLabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.font = UIFont(name:"Montserrat-Bold", size: 12.0)
      label.padding(20, 20, 0, 0)
      label.textColor =  UIColor(hexString: "#FFFFFF")
      label.textAlignment = .left
    }
    
    static func styleSmallcount(_ label: UILabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
      label.font = UIFont(name:"Montserrat-Bold", size: 16.0)
      label.textColor =  UIColor(hexString: "#FFFFFF")
        label.textAlignment = .center
    }
    
    static func styleSmallStartm(_ label: PaddingLabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
        label.padding(60, 10, 0, 0)
      label.font = UIFont(name:"Montserrat-Regular", size: 14.0)
      label.textColor =  UIColor(hexString: "#FFFFFF")
        label.textAlignment = .left
    }
    
    static func styleSmallFrinds(_ label: PaddingLabel, with text: String?) {
      label.text = text
      label.numberOfLines = 0
        label.padding(0, 0, 30, 0)
      label.font = UIFont(name:"Montserrat-Regular", size: 16.0)
      label.textColor =  UIColor(hexString: "#FFFFFF")
        label.textAlignment = .left
    }
    
  static func styleButton(_ button: UIButton) {
    button.backgroundColor = .white
    button.setTitle("Next", for: .normal)
    button.titleLabel?.font =  UIFont(name:"Montserrat-Regular", size: 18.0)
    button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    button.layer.cornerRadius = 8
  }
    static func styleButtonMain(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Verify", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Regular", size: 18.0)
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
    
    static func styleButtonhappy(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("I'm happy to Give", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 18.0)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
    }
    
    
    static func styleButtonoffer(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Continue", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 18.0)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
    }
    
    
    
    static func styleButtonNuy(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Download app to buy klapz", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 18.0)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
    }
}


public class PaddingLabel: UILabel {
    
    var insets = UIEdgeInsets.zero
    
    /// Добавляет отступы
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    public override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 20,
        bottom: 0,
        right: 0
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

