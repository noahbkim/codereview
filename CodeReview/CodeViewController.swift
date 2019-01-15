//
//  ViewController.swift
//  codereview
//
//  Created by Noah Kim on 1/14/19.
//  Copyright © 2019 Noah Kim. All rights reserved.
//

import UIKit
import WebKit

var webViewContext = 0;

class CodeViewController: UIViewController, WKScriptMessageHandler {

  @IBOutlet weak var navigationBar: UINavigationBar!
  @IBOutlet weak var languageButton: UIBarButtonItem!
  @IBOutlet weak var codeView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.loadCodeView()
  }
  
  func configureCodeView() {
    self.codeView.configuration.userContentController.add(self, name: "background")
  }
  
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    print("\(message.body)")
  }

//  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//    guard let change = change else { return }
//    if context != &webViewContext { return super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)}
//    if keyPath == "background" {
//      print(object as String)
//    }
//  }
  
  func loadCodeView() {
    let indexURL = URL(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html")!)
    let indexDirectoryURL = URL(fileURLWithPath: Bundle.main.resourceURL!.appendingPathComponent("Web").path)
    self.codeView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
    self.codeView.loadFileURL(indexURL, allowingReadAccessTo: indexDirectoryURL)
  }
  
}

