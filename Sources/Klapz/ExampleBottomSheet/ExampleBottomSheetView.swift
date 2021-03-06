//
//  ExampleBottomSheetView.swift
//  BottomSheetExample
//
//  Created by Gaetano Matonti on 22/11/20.
//

import UIKit
import CountryPickerView
import NKVPhonePicker
import MultilineTextField
public class ExampleBottomSheetView: UIView {
  
  // MARK: - UI Elements
  
  let titleLabel = UILabel()

    let descibelable = UILabel()
    let X = PaddingLabel()
  let goldBorderedUIView = UIView()
  let descriptionLabel = UILabel()
  let descriptionLabelOTP = UILabel()
  let resend = PaddingLabel()
  let errobutton = UIButton(type: .system)
    let errobutton2 = UIButton(type: .system)
    let thnxtext = PaddingLabel()
    
    let spacePad = PaddingLabel()
    let frinds = PaddingLabel()
  let borderUI = CALayer()
  var bottomTextField = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 30.00))
  var text = ""
  var OTPField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
  var KlapzField: UITextField = UITextField();
  let button = UIButton(type: .system)
    let containerView = UIView(frame: CGRect(x:0,y:0,width:120,height:120))
    
    let myImageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00))
    let logowhite:UIImageView = UIImageView()

    
    let buttonverify = UIButton(type: .system)
    var textFieldmulti = MultilineTextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 150.00))
    let titlerclab = UILabel()
    let balanceKlapz = UILabel()
    let buttonklapz = UIButton(type: .system)
    let DownloadKlapz = UIButton(type: .system)
    var Klapxexpretion: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 500.00, height: 150.00));
    
    let giveklapxtext = UILabel()
    let getnotify = UILabel()
    let termandconditopn = PaddingLabel()
    let maintitletext = PaddingLabel()
    let happytogo = UIButton(type: .system)
    let errortext = PaddingLabel()
    let errortextmain = PaddingLabel()
//    let UIViewController =
    let textField = TextFieldWithPadding(frame: CGRect(x: 0, y: 0, width: 500.00, height: 30.00));
    
    var KlapzConfig: [String: Any] = [
        "key":"xxx",
        "PreferKlapz":"10,20,30",
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
        let stack = UIStackView(arrangedSubviews: [Header,descriptionLabel,descibelable,textField,errortext, button])
        stack.axis = .vertical
        stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
        return stack
      }()
    
    
    
    lazy var contentStackotp: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [Header , descriptionLabelOTP,OTPField,errortextmain,resend,buttonverify,])
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
            button.layer.cornerRadius = 20
            button.tag = Int(value) ?? 10
            button.heightAnchor.constraint(equalToConstant: 42).isActive = true
            button.widthAnchor.constraint(equalToConstant: 42).isActive = true
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
        
        let stackmain = UIStackView(arrangedSubviews: [[containerViewiomage,X],arrayOfButtons,[KlapzField]].reduce([], +))
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
        spacela1.padding(30, 0, 0, 0)
        
        var spacela2 = PaddingLabel()
        spacela2.text = ""
        spacela2.numberOfLines = 0
        spacela2.padding(20, 0, 0, 0)
        
        
       
        let cb = Checkbox(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        cb.checkmarkStyle = .tick
        cb.backgroundColor = UIColor(hexString: "#FFFFFF")
        cb.uncheckedBorderColor = UIColor(hexString: "#FFFFFF")
        cb.checkedBorderColor = UIColor(hexString: "#FFFFFF")
        cb.checkmarkColor = UIColor(hexString: "#ff946d")
        cb.isChecked = true
        
        let containerViewtext1 = UIView(frame: CGRect(x:0,y:0,width:30,height:30))
        containerViewtext1.addSubview(cb)
        containerViewtext1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        containerViewtext1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        let stacktest1 = UIStackView(arrangedSubviews: [containerViewtext1,frinds])
        stacktest1.axis = .horizontal
        stacktest1.spacing = 16
        stacktest1.alignment = .center
        stacktest1.distribution = .fillProportionally
        stacktest1.translatesAutoresizingMaskIntoConstraints = false
        
      let stack = UIStackView(arrangedSubviews: [Header , titlerclab,textFieldmulti,spacela,goldBorderedUIView,spacela1,stacktest1,buttonklapz,errobutton2,balanceKlapz,spacela2,errortextmain,errobutton])
      stack.axis = .vertical
      stack.spacing = 16
    //    stack.setCustomSpacing(24, after: descriptionLabel)
      return stack
    }()

    
    lazy var IntroStack: UIStackView = {
        let catImage2 = UIImage(named: "noti.png")
        let containerViewtext = UIView(frame: CGRect(x:0,y:0,width:50,height:50))
        var loginrto = UIImageView()
        containerViewtext.addSubview(loginrto)
        loginrto.contentMode = UIView.ContentMode.scaleAspectFit
        loginrto.frame.size = CGSize(width: 25, height: 25)
        loginrto.frame.size.width = 25
        loginrto.frame.size.height = 25
        loginrto.image = catImage2
        let stacktest = UIStackView(arrangedSubviews: [loginrto,getnotify])
        stacktest.axis = .horizontal
        stacktest.spacing = 16
        stacktest.alignment = .fill
        stacktest.distribution = .fillProportionally
        stacktest.translatesAutoresizingMaskIntoConstraints = false
        
        
        let catImage3 = UIImage(named: "klap2.png")
        let containerViewtext1 = UIView(frame: CGRect(x:0,y:0,width:50,height:50))
        var loginrto1 = UIImageView()
        containerViewtext1.addSubview(loginrto1)
        loginrto1.contentMode = UIView.ContentMode.scaleAspectFit
        loginrto1.frame.size = CGSize(width: 30, height: 30)
        loginrto1.frame.size.width = 30
        loginrto1.frame.size.height = 30
    
        loginrto1.image = catImage3
        let stacktest1 = UIStackView(arrangedSubviews: [loginrto1,giveklapxtext])
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
  
override init(frame: CGRect) {
    super.init(frame: frame)
    
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
    KlapzField.addConstraint(KlapzField.heightAnchor.constraint(equalToConstant: 50))
    KlapzField.addConstraint(KlapzField.widthAnchor.constraint(equalToConstant: 50))
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
    buttonklapz.addTarget(self, action: #selector(buttonVerifyKlapz), for: .touchUpInside)
    happytogo.addTarget(self, action: #selector(buttonhappy), for: .touchUpInside)
    
    
    setup()
    
    KlapzField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    
    
    let catImage = UIImage(named: "klapzicon.png")
    
    myImageView.contentMode = UIView.ContentMode.scaleAspectFit
    myImageView.image = catImage
    
    
    let catImage2 = UIImage(named: "wihteklapz.png")
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
    textFieldmulti.leftView = spacela1
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
        if(textField.text != ""){
            if(a! > 5){
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
        
        if(textField.text == "1234567890" || textField.text == "" || textField.text?.count != 10 ){
            ExampleBottomSheetView.styleSmalltexterror(
              errortext,
              with: "Please enter a valid mobile number"
            )
            errortext.isHidden = false
            
//            setupOtp()

        }else{
            errortext.isHidden = true // show
            setupOtp()
        }
        print(String(textField.text ?? "asd"))
    }
    @objc func buttonVerifyClicked() {
        if(OTPField.text?.count != 4 || OTPField.text == ""){
        ExampleBottomSheetView.styleSmalltexterror(
          errortextmain,
          with: "Please enter a valid code"
        )
            errortextmain.isHidden = false // show
        }else{
            errortextmain.isHidden = true // show
            setupKlapz()
        }
  
        
        print(String(OTPField.text ?? "asd"))
    }
    
    
    @objc func buttonVerifyKlapz() {
//        ExampleBottomSheetView.styleSmalltexterror(
//          errortextmain,
//          with: "You have only 0 claps left. Can't contribute 2 claps"
//        )
//        errortextmain.isHidden = false
//        errobutton.isHidden = false
        
            setupKlapzContent()
        print("Call api")
    }
    
    @objc func buttonhappy(){
        setupbuttonhappy()
    }
   
    @objc func Preferklapz(_ sender : UIButton) {
        print(sender.tag)
        buttonklapz.setTitle("Give this summary: " + String(sender.tag) + " Klapz", for: .normal)
        KlapzField.text = String(sender.tag)
    }
    
    

    
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
    style()
    
  }
  
  // MARK: - SSUL
  
  private func setup() {
    addSubview(IntroStack)
    setConstraintsintro()
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
      with: "Your balance: 5"
    )
    
    
    ExampleBottomSheetView.styleSmallStart(
        giveklapxtext,
        with: "  Give as little as ???2 when you like a content."
    )
    ExampleBottomSheetView.styleSmallStartm(
        maintitletext,
        with: "Micro rewarding free content on the internet."
    )
    
    var myMutableString1 = NSMutableAttributedString(string: "Micro rewarding free content on the internet.\nLearn more", attributes: [NSAttributedString.Key.font :UIFont(name:"Montserrat-Regular", size: 15.0)])
    let paragraphStyle = NSMutableParagraphStyle()

    // *** set LineSpacing property in points ***
    paragraphStyle.lineSpacing = 2
    let string              = "Micro rewarding free content on the internet.\nLearn more"
    let range               = (string as NSString).range(of: "Learn more")
    myMutableString1.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString1.length))
//    myMutableString1.addAttribute(NSAttributedString.Key.link, value: NSURL(string: "https://dev.klapz.club/")!, range: range)
    myMutableString1.addAttribute(NSAttributedString.Key.underlineStyle, value: NSNumber(value: 1), range: range)
    myMutableString1.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location:45,length:11))
    maintitletext.attributedText = myMutableString1
    
    ExampleBottomSheetView.styleSmallStarttearm(
        termandconditopn,
        with: "* Terms & Conditions"
    )
    
    var myMutableString = NSMutableAttributedString(string: "* Terms & Conditions apply", attributes: [NSAttributedString.Key.font :UIFont(name:"Montserrat-Regular", size: 15.0)])
    myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:1))
    myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location:21,length:5))
    termandconditopn.attributedText = myMutableString
    
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
    ExampleBottomSheetView.styleButtonKlapz(buttonklapz)
    ExampleBottomSheetView.styleButtonDownload(DownloadKlapz)
    ExampleBottomSheetView.styleButtonhappy(happytogo)
    ExampleBottomSheetView.styleButtonNuy(errobutton)
    ExampleBottomSheetView.styleButtonNuy(errobutton2)
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
    
    static func styleButtonNuy(_ button: UIButton) {
      button.backgroundColor = .white
      button.setTitle("Download app to buy klapz", for: .normal)
      button.titleLabel?.font =  UIFont(name:"Montserrat-Bold", size: 18.0)
      button.setTitleColor(  UIColor(hexString: "#ff7f57"), for: .normal)
      button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
      button.layer.cornerRadius = 8
    }
}


class PaddingLabel: UILabel {
    
    var insets = UIEdgeInsets.zero
    
    /// ?????????????????? ??????????????
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

