//
//  BackgroundView.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/21/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class GameView: UIView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let background = UIView()
    private let borderWidth = CGFloat(20)
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        background.backgroundColor = UIColor.QBlue()
        self.addSubview(background)
        
        self.restart()
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "Avenir-Black", size: 85)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        background.addSubview(titleLabel)
        
    }
    
    func restart() {
        titleLabel.text = "Place on\nForehead"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius = CGFloat(25)
        self.layer.cornerRadius = cornerRadius
        
        background.layer.cornerRadius = cornerRadius
        
        background.size = CGSizeMake(self.width - borderWidth, self.height - borderWidth)
        background.moveToCenterOfView(self)
        
        self.titleLabel.sizeToFit()
        self.titleLabel.moveToCenterOfView(background);
    }
}
