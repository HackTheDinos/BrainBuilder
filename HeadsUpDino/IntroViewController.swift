//
//  ViewController.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/21/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit
import CoreMotion
import AudioToolbox

class IntroViewController: UIViewController {
    
    let gameView = GameView(frame: CGRect.zero)
    let motionManager = CMMotionManager()
    var hasStartedGame = false {
        didSet {
            self.countdownToStart()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(gameView)
        motionManager.accelerometerUpdateInterval = 1/60
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void in
            if let data = data where data.userAcceleration.z > 0.1 {
                if (!self.hasStartedGame) {
                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                    self.hasStartedGame = true
                    self.motionManager.stopDeviceMotionUpdates()
                }
            }
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        motionManager.stopDeviceMotionUpdates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gameView.frame = self.view.bounds
    }
    
    func countdownToStart() {
        gameView.titleLabel.text = "GET READY!"
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "nextNumber", userInfo: nil, repeats: false)
    }
    
    var number = 3
    func nextNumber() {
        if number > 0 {
            gameView.titleLabel.text = "\(number)"
            number--
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "nextNumber", userInfo: nil, repeats: false)
        } else {
            let gameViewController = GameViewController()
            self.navigationController?.pushViewController(gameViewController, animated: true)
        }
    }
    
}

