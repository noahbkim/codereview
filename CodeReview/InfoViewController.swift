//
//  ContainerViewController.swift
//  codereview
//
//  Created by Noah Kim on 1/15/19.
//  Copyright © 2019 Noah Kim. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

  var source: CodeViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupGestures()
  }
  
  func setupGestures() {
    let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeRight(_:)))
    swipeRecognizer.direction = .right
    self.view.isUserInteractionEnabled = true
    self.view.addGestureRecognizer(swipeRecognizer)
  }
  
  @objc func handleSwipeRight(_ sender: UISwipeGestureRecognizer) {
    self.source!.dismissInfo()
  }
  
}
