//
//  DinoCardView.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class DinoCardView: UIView {

    let imageView = UIImageView(frame: CGRect.zero)
    let subtitle = UILabel(frame: CGRect.zero)
    let timerLabel = UILabel()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.clipsToBounds = true
        imageView.hidden = true

        self.addSubview(imageView)
        self.addSubview(subtitle)
        self.addSubview(titleLabel)
        
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "Avenir-Medium", size: 64)
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        titleLabel.textAlignment = .Center

        subtitle.font = UIFont(name: "Avenir-Medium", size: 40)
        subtitle.textColor = UIColor.blackColor()
        subtitle.numberOfLines = 2
        subtitle.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        subtitle.textAlignment = .Center
        
        timerLabel.font = UIFont(name: "Avenir-Medium", size: 90)
        timerLabel.text = "60"
        self.addSubview(timerLabel)
        
        timerLabel.textColor = UIColor.QRed()
        
        self.bringSubviewToFront(subtitle)
        self.bringSubviewToFront(titleLabel)
        
    }
    
    func showImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.hidden = false
        subtitle.hidden = false
        titleLabel.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    func hideImage() {
        imageView.hidden = true
        subtitle.hidden = true
        titleLabel.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.width = self.width
        titleLabel.height = CGFloat(77)
        titleLabel.x = 0
        titleLabel.y = 0
        
        imageView.frame = self.bounds
        
//        timerLabel.sizeToFit()
//        timerLabel.height = imageView.height
//        timerLabel.x = 130
//        timerLabel.y = imageView.y
        
        subtitle.size = CGSizeMake(self.width, 96)
        subtitle.y = self.height - subtitle.height
        subtitle.x = 0
    }
}
