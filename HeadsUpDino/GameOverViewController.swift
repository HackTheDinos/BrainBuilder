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
    let correctTitle = UILabel()
    let passedTitle = UILabel()
    let correctLabel = UILabel()
    let passedLabel = UILabel()
    let startOver = UIButton()
    
    init(dinos: Dinos) {
        self.dinos = dinos
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
         self.view = UIScrollView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.numberOfLines = 0
        passedLabel.numberOfLines = 0
        let listFont = UIFont(name: "Avenir-Book", size: 20)
        let titleFont = UIFont(name: "Avenir-Bold", size: 25)
        
        correctLabel.text = dinos.correctDinoNames().joinWithSeparator("\n")
        passedLabel.text = dinos.passedDinoNames().joinWithSeparator("\n")
        correctLabel.font = listFont
        passedLabel.font = listFont
        
        correctLabel.textColor = UIColor.QGreen()
        passedLabel.textColor = UIColor.grayColor()
        
        correctTitle.textColor = UIColor.QGreen()
        passedTitle.textColor = UIColor.grayColor()
        correctTitle.font = titleFont
        passedTitle.font = titleFont
        passedTitle.text = "Passed"
        correctTitle.text = "Correct!"
        
        
        view.addSubview(passedLabel)
        view.addSubview(correctLabel)
        view.addSubview(passedTitle)
        view.addSubview(correctTitle)
        view.addSubview(startOver)
        
        startOver.setTitle("Start Over", forState: .Normal)
        startOver.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startOver.addTarget(self, action: "restartGame", forControlEvents: .TouchUpInside)

    }
    
    func restartGame() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var frame = CGRect.zero
        if let scrollView = view as? UIScrollView {
            passedTitle.sizeToFit()
            passedTitle.y = CGFloat(20)
            passedTitle.moveToHorizontalCenterOfView(scrollView)
            
            passedLabel.sizeToFit()
            passedLabel.moveBelowAndAlignWithSiblingView(passedTitle, margin: CGFloat(10), alignment: .Center)
            
            correctTitle.sizeToFit()
            correctTitle.moveBelowAndAlignWithSiblingView(passedLabel, margin: CGFloat(20), alignment: .Center)
            
            correctLabel.sizeToFit()
            correctLabel.moveBelowAndAlignWithSiblingView(correctTitle, margin: CGFloat(10), alignment: .Center)
            
            startOver.sizeToFit()
            startOver.moveBelowAndAlignWithSiblingView(correctLabel, margin: CGFloat(20), alignment: .Center)
            
            frame = CGRectIntersection(passedLabel.frame, passedTitle.frame)
            frame = CGRectIntersection(frame, correctTitle.frame)
            frame = CGRectIntersection(frame, correctLabel.frame)
            frame = CGRectIntersection(frame, startOver.frame)
            
            scrollView.contentSize = frame.size
            
        }
    }
    
}
