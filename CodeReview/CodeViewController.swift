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

  @IBOutlet weak var codeView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureCodeView()
    self.loadCodeView()
  }
  
  func configureCodeView() {
    self.codeView.configuration.userContentController.add(self, name: "background")
  }
  
  func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    switch message.name {
    case "background":
      self.setBackgroundColor(message.body as! String)
    default:
      break
    }
  }
  
  func loadCodeView() {
    let indexURL = URL(fileURLWithPath: Bundle.main.path(forResource: "index", ofType: "html")!)
    let indexDirectoryURL = URL(fileURLWithPath: Bundle.main.resourceURL!.appendingPathComponent("Web").path)
    self.codeView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
    self.codeView.loadFileURL(indexURL, allowingReadAccessTo: indexDirectoryURL)
  }
  
  func setBackgroundColor(_ css: String) {
    guard let values = colorFromString(css) else { return }
    let color = UIColor(values)
    self.codeView.backgroundColor = color
    self.view.backgroundColor = color
  }
  
}

