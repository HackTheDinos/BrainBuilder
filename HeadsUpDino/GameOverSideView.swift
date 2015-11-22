//
//  GameOverSideView.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class GameOverSideView: UIView {

    let title = UILabel()
    let scrollView = UIScrollView()
    var dinoViews: [UIView] = []
    let showsImages: Bool
    
    init(titleText: String, titleColor: UIColor, dinos: [Dino], shouldShowImages: Bool) {
        self.showsImages = shouldShowImages
        super.init(frame: CGRect.zero)
        self.addSubview(title)
        title.font = UIFont(name: "Avenir-Black", size: 32)
        title.numberOfLines = 2
        title.textAlignment = .Center
        title.text = titleText
        title.textColor = titleColor
        
        self.addSubview(scrollView)
        
        for dino in dinos {
            if (self.showsImages) {
                let dinoView = DinoImageView(imageName: dino.imageName, text: dino.name)
                scrollView.addSubview(dinoView)
                dinoViews.append(dinoView)
            } else {
                let dinoView = UILabel()
                dinoView.text = dino.name
                dinoView.font = UIFont(name: "Avenir-Medium", size: 18)
                dinoView.textAlignment = .Center
                scrollView.addSubview(dinoView)
                dinoViews.append(dinoView)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        title.sizeToFit()
        title.moveToHorizontalCenterOfView(self)
        title.y = 23
        
        scrollView.height = self.height - title.maxY
        scrollView.width = 310
        
        scrollView.moveBelowAndAlignWithSiblingView(title, margin: 18, alignment: .Center)
        
        var i = 0
        var y = CGFloat(0)
        var x = CGFloat(0)
        
        if (self.showsImages) {
            for view in dinoViews {
                view.sizeToFit()
                view.x = x
                view.y = y
                i++
                if (i%2 == 0) {
                    x = 0
                    y += 150
                } else {
                    x = 150
                }
                
            }
        } else {
            for view in dinoViews {
                view.sizeToFit()
                view.moveToHorizontalCenterOfView(scrollView)
                view.y = y
                y += view.height + 10
            }
        }
        
        scrollView.contentSize = CGSizeMake(scrollView.width, y + 150)
        
    }
    

}
