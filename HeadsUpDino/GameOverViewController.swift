//
//  GameOverViewController.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    let dinos: Dinos
    let startOver = UIButton()
    let leftView: GameOverSideView
    let rightView: GameOverSideView
    
    init(dinos: Dinos) {
        self.dinos = dinos
        self.leftView = GameOverSideView(titleText: "Correct! \n 👍", titleColor: UIColor.QBlue(), dinos: dinos.correctDinos, shouldShowImages: true)
        self.rightView = GameOverSideView(titleText: "Missed \n 😔", titleColor: UIColor.QRed(), dinos: dinos.passedDinos, shouldShowImages:  false)
        
        super.init(nibName: nil, bundle: nil)
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(startOver)
        
        startOver.setTitle("Play Again", forState: .Normal)
        startOver.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startOver.backgroundColor = UIColor.QBlue()
        startOver.addTarget(self, action: "restartGame", forControlEvents: .TouchUpInside)
        startOver.titleLabel?.font = UIFont(name: "Avenir-Black", size: 32)
        
        view.addSubview(self.rightView)
        view.addSubview(self.leftView)

    }
    
    func restartGame() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let startOverHeight = CGFloat(295)
        
        self.leftView.size = CGSizeMake(self.view.width/2, startOverHeight)
        self.rightView.size = self.leftView.size
        self.rightView.moveToRightOfSiblingView(self.leftView, margin: 0)
        self.leftView.clipsToBounds = true
            
        startOver.size = CGSizeMake(180, 60)
        startOver.y = startOverHeight
        startOver.layer.cornerRadius = 3
        startOver.moveToHorizontalCenterOfView(self.view)
        
    }
    
}
