//
//  DesignableView.swift
//  NoStory
//
//  Created by Andrey Yastrebov on 25/07/2019.
//  Copyright © 2019 Andrey Yastrebov. All rights reserved.
//

import UIKit

@IBDesignable

class DesignableView: UIView {

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = .red
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2.0
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        backgroundColor = .red
        layer.masksToBounds = true
    }
}
