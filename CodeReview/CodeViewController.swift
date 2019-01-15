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
  var infoViewController: InfoViewController!
  var window: UIWindow?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupInfoView()
    self.setupGestures()
    self.configureCodeView()
    self.loadCodeView()
  }
  
  func setupInfoView() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    self.infoViewController = storyboard.instantiateViewController(withIdentifier: "Info") as? InfoViewController
    self.infoViewController.source = self
  }
  
  func setupGestures() {
    let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeLeft(_:)))
    swipeRecognizer.direction = .left
    self.view.isUserInteractionEnabled = true
    self.view.addGestureRecognizer(swipeRecognizer)
  }
  
  func presentInfo() {
    self.window = self.view.window
    self.view.window!.layer.add(Transition.MoveIn(), forKey: kCATransition)
    self.present(self.infoViewController, animated: false, completion: nil)
  }
  
  func dismissInfo() {
    self.window!.layer.add(Transition.Reveal(), forKey: kCATransition)
    self.dismiss(animated: false, completion: nil)
  }
  
  @objc func handleSwipeLeft(_ sender: UISwipeGestureRecognizer) {
    presentInfo()
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
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
}

