//
//  FancyView.swift
//  Connect
//
//  Created by Lin Myat on 20/08/2021.
//

import UIKit

class FancyView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let shadowGray : CGFloat = 120.0 / 255.0

        layer.shadowColor = UIColor(red: shadowGray, green: shadowGray, blue: shadowGray, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = self.frame.width / 2
    }

}

