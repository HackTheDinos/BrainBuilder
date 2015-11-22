//
//  GameViewController.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit
import CoreMotion

let totalTime = CGFloat(20)

class GameViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    var timeLeft = totalTime
    var dinoIsShown = false
    let dinos = Dinos()

    let gameView = DinoCardView(frame: CGRect.zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(gameView)

        self.showDino()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (data, error) -> Void in
            self.getAccelerometerData(data)
        }
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick:", userInfo: nil, repeats: true)
    }
    
    func tick(timer: NSTimer) {
        if (timeLeft > 0) {
            self.gameView.percentDone = (totalTime - timeLeft)/totalTime
            timeLeft--
        } else {
            timer.invalidate()
            let gameOverViewController = GameOverViewController(dinos: dinos)
            self.navigationController?.pushViewController(gameOverViewController, animated: false)
        }
    }
    
    func getAccelerometerData(data: CMAccelerometerData?) {
        let tolerance = 0.9
        if let z = data?.acceleration.z where fabs(z) > tolerance {
            if z > 0 {
                self.gameView.titleLabel.text = "CORRECT"
                self.gameView.backgroundColor = UIColor.QGreen()
                dinos.correct()
                
            } else {
                self.gameView.titleLabel.text = "Pass"
                self.gameView.backgroundColor = UIColor.QOrange()
                dinos.passed()
            }
            self.gameView.hideImage()
            gameView.subtitle.text = ""
            dinoIsShown = false
        } else if let z = data?.acceleration.z where fabs(z) < tolerance * 0.5 {
            self.showDino()
        }
    }
    
    func showDino() {
        if (dinoIsShown) {
            return
        }
        
        dinos.getNextDino()
        self.dinoIsShown = true
        if let dino = dinos.currentDino {
            gameView.titleLabel.text = dino.name
            gameView.subtitle.text = dino.tagline
            gameView.showImage(dino.imageName)
        }
        gameView.setNeedsLayout()
        gameView.layoutIfNeeded()
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        motionManager.stopAccelerometerUpdates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gameView.frame = self.view.bounds
    }

}
