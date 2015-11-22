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
    let titleLabel = UILabel()
    var percentDone = CGFloat(0) {
        didSet {
            topBar.percentDone = percentDone
            bottomBar.percentDone = percentDone
        }
    }
    private let topBar = BarView()
    private let bottomBar = BarView()
    
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
        
        self.bringSubviewToFront(subtitle)
        self.bringSubviewToFront(titleLabel)
        
        self.addSubview(topBar)
        self.addSubview(bottomBar)
        
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
        
        topBar.sizeToFit()
        let barHeight = topBar.height
        
        titleLabel.width = self.width
        titleLabel.height = 77
        titleLabel.moveBelowSiblingView(topBar, margin: 0)
        
        imageView.height = self.height - 50
        imageView.width = self.width
        imageView.y = 50
        
        var subtitleSize = CGSizeMake(self.width, CGFloat.max)
        let preferredSize = subtitle.sizeThatFits(subtitleSize)
        subtitleSize.height = fmax(96, preferredSize.height + 20)
        subtitle.size = subtitleSize
        subtitle.y = self.height - subtitle.height - barHeight
        subtitle.x = 0
        bottomBar.sizeToFit()
        bottomBar.moveBelowSiblingView(subtitle, margin: 0)
        
    }
}
