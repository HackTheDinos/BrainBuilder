//
//  IntroViewController.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    let childNavigationController = UINavigationController()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        childNavigationController.navigationBarHidden = true
        self.addChildViewController(childNavigationController)
        self.view.addSubview(childNavigationController.view)
        childNavigationController.view.frame = self.view.bounds
        let viewController = IntroViewController()
        childNavigationController.pushViewController(viewController, animated: false)

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
}
