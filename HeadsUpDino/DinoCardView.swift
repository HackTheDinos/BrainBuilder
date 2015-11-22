//
//  DinoCardView.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class DinoCardView: GameView {

    let imageView = UIImageView(frame: CGRect.zero)
    let subtitle = UILabel(frame: CGRect.zero)
    let timerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = UIImage(named: "allosaurus")
        imageView.image = image
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.clipsToBounds = true
        imageView.hidden = true

        self.addSubview(imageView)
        self.addSubview(subtitle)
        
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "Avenir-Black", size: 50)

        subtitle.font = UIFont(name: "Avenir-Medium", size: 40)
        subtitle.textColor = UIColor.whiteColor()
        
        timerLabel.font = UIFont(name: "Avenir-Medium", size: 50)
        timerLabel.text = "60"
        self.addSubview(timerLabel)
        timerLabel.textColor = UIColor.whiteColor()
        
    }
    
    func showImage() {
        imageView.hidden = false
    }
    
    func hideImage() {
        imageView.hidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margin = CGFloat(20)
        
        imageView.size = CGSize(width: 300, height: 200)
        imageView.moveToCenterOfView(self)
        
        titleLabel.moveAboveAndAlignWithSiblingView(imageView, margin: margin, alignment: .Center)

        subtitle.sizeToFit()
        subtitle.moveBelowAndAlignWithSiblingView(imageView, margin: margin, alignment: .Center)
        
        timerLabel.sizeToFit()
        timerLabel.moveBelowAndAlignWithSiblingView(imageView, margin: 0, alignment: .Center)
    }
}
