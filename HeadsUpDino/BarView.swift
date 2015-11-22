//
//  BarView.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class BarView: UIView {

    private let redBar = UIView()
    private let blueBar = UIView()
    var percentDone = CGFloat(0) {
        didSet {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        redBar.backgroundColor = UIColor.QRed()
        blueBar.backgroundColor = UIColor.QBlue()
        self.addSubview(redBar)
        self.addSubview(blueBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        var newSize = size
        newSize.height = 10
        if let superview = self.superview {
            newSize.width = superview.width
        }

        return newSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        redBar.height = self.height
        redBar.width = self.width * percentDone
        blueBar.height = self.height
        blueBar.width = self.width - redBar.width
        redBar.moveToRightOfSiblingView(blueBar, margin: 0)
    }
}
