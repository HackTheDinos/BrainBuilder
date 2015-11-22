//
//  GameViewController.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    let motionManager = CMMotionManager()

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
    }
    
    func getAccelerometerData(data: CMAccelerometerData?) {
        let tolerance = 0.9
        if let z = data?.acceleration.z where fabs(z) > tolerance {
            if z > 0 {
                self.gameView.titleLabel.text = "CORRECT"
                self.gameView.background.backgroundColor = UIColor.QGreen()
                
            } else {
                self.gameView.titleLabel.text = "Pass"
                self.gameView.background.backgroundColor = UIColor.QOrange()
            }
            self.gameView.hideImage()
            gameView.subtitle.text = ""
        } else if let z = data?.acceleration.z where fabs(z) < tolerance * 0.5 {
            self.showDino()
        }
    }
    
    func showDino() {
        gameView.titleLabel.text = "Allosaurus"
        gameView.subtitle.text = "The allosaurus rox"
        gameView.showImage()
        gameView.background.backgroundColor = UIColor.QBlue()
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
