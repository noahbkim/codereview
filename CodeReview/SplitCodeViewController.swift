//
//  SplitCodeViewController.swift
//  codereview
//
//  Created by Noah Kim on 1/15/19.
//  Copyright © 2019 Noah Kim. All rights reserved.
//

import UIKit

class SplitCodeViewController: UISplitViewController, UISplitViewControllerDelegate {
  
  private var statusBarHidden: Bool = false

  override func viewDidLoad() {
    super.viewDidLoad()
    self.statusBarHidden = true
    self.setNeedsStatusBarAppearanceUpdate()
    self.delegate = self
  }
  
  func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewController.DisplayMode) {
    switch (displayMode) {
    case .allVisible, .primaryOverlay, .automatic:
      self.statusBarHidden = false
    case .primaryHidden:
      self.statusBarHidden = true
    }
    self.setNeedsStatusBarAppearanceUpdate()
  }
  
  override var prefersStatusBarHidden: Bool {
    return self.statusBarHidden
  }

}
