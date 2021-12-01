//
//  ViewController.swift
//  BottomSheetExample
//
//  Created by Gaetano Matonti on 22/11/20.
//

import UIKit


public final class KlapzController: UIViewController {
  
  private let viewModel = ViewModel()
  private let mainView = View()
    let jsonObject: [String: Any] = [
        "key": "kuaduekwamk1ah",
        "Envirment":"SandBox",
        "klapz":2,
        "PreferKlapz":"10,20,30",
        "expressionPlaceholder":"Tell us, what do you love about this book summary",
        "appId":"1001",
        "ThankText":"Thanks for Klapping.",
        "Mode":"Default",
        
        "Url":"",
        //OR
        "title":"Content Title",
        "tags":"",
        "ContentType":"booklet", // as it is
        "contentId":"contentId", // Chapter Id
        "creatorId":"1", // Value is always "1"
        "creatorName":"creatorName", // Amruth Deshmukh
        "creatorScreenName":"creatorScreenName", // Amruth Deshmukh

    ]
    
//  public var KlapbConfig: [String: Any]
//  public var KlapbConfignew: [String: Any]
   public init (){
//    KlapbConfignew = KlapbConfig

    super.init(nibName: nil, bundle: nil)
  }
    @available(*, unavailable)
     required init?(coder: NSCoder) {
         fatalError("This class does not support NSCoder")
     }
    
    public override func loadView() {
    super.loadView()
    
    view = mainView
  }
  
    public override func viewDidLoad() {
    super.viewDidLoad()
    
    mainView.populateSegmentedControl(picker: \.sheetSizingStylePicker, with: viewModel.sheetSizingItems)
    mainView.populateSegmentedControl(picker: \.handleStylePicker, with: viewModel.handleStyleItems)
    
    mainView.button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
    mainView.sheetSizingStylePicker.addTarget(self, action: #selector(didSelectSegmentedItem), for: .valueChanged)
    mainView.handleStylePicker.addTarget(self, action: #selector(didSelectSegmentedItem), for: .valueChanged)
  }
  
  @objc private func didPressButton(_ sender: UIButton) {
    let controller = BottomSheetViewController(KlapConfig: jsonObject)
    controller.sheetCornerRadius = 32
    controller.sheetSizingStyle = .toSafeAreaTop
    controller.handleStyle = .outside
    controller.contentInsets = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    present(controller, animated: true, completion: nil)
  }
    
@objc public func StartKlapz() {
      let controller = BottomSheetViewController(KlapConfig: jsonObject)
      controller.sheetCornerRadius = 32
      controller.sheetSizingStyle = .toSafeAreaTop
      controller.handleStyle = .outside
      controller.contentInsets = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
      present(controller, animated: true, completion: nil)
    }
  
  @objc public func didSelectSegmentedItem(_ sender: UISegmentedControl) {
    if sender === mainView.sheetSizingStylePicker {
      viewModel.selectedSheetSizingStyle = viewModel.sheetSizingItems[mainView.sheetSizingStylePicker.selectedSegmentIndex].style
      return
    }
    if sender === mainView.handleStylePicker {
      viewModel.selectedHandleStyle = viewModel.handleStyleItems[mainView.handleStylePicker.selectedSegmentIndex].style
      return
    }
  }
}
