//
//  DinoImageView.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class DinoImageView: UIView {
    let imageView = UIImageView()
    let title = UILabel()
    
    init(imageName: String, text: String) {
        super.init(frame: CGRect.zero)
        
        title.font = UIFont(name: "Avenir-Medium", size: 18)
        title.textAlignment = .Center
        title.text = text
        title.numberOfLines = 2
        
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.addSubview(imageView)
        self.addSubview(title)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        return CGSizeMake(130, 150)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.size = CGSizeMake(130, 130)
        title.size = title.sizeThatFits(imageView.size)
        title.moveBelowAndAlignWithSiblingView(imageView, margin: 4, alignment: .Center)
    }

}
