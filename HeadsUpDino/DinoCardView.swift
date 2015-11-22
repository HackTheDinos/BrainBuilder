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
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.clipsToBounds = true
        imageView.hidden = true

        self.addSubview(imageView)
        self.addSubview(subtitle)
        
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "Avenir-Black", size: 45)

        subtitle.font = UIFont(name: "Avenir-Medium", size: 35)
        subtitle.textColor = UIColor.whiteColor()
        subtitle.numberOfLines = 0
        
        timerLabel.font = UIFont(name: "Avenir-Medium", size: 90)
        timerLabel.text = "60"
        self.addSubview(timerLabel)
        timerLabel.textColor = UIColor.QRed()
        
    }
    
    func showImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
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
        
        titleLabel.moveToHorizontalCenterOfView(self)
        titleLabel.y = CGFloat(35)
        
        imageView.size = CGSize(width: 325 , height: 175 )
        imageView.moveBelowSiblingView(titleLabel, margin: 0)
        imageView.moveToRightPositionOfSuperview(40)
        
        timerLabel.sizeToFit()
        timerLabel.height = imageView.height
        timerLabel.x = 130
        timerLabel.y = imageView.y
        
        subtitle.size = subtitle.sizeThatFits(self.size)
        subtitle.moveBelowSiblingView(self.imageView, margin: 0)
        subtitle.moveToHorizontalCenterOfView(self)
    }
}
