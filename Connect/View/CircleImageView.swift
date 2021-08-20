//
//  CircleImageView.swift
//  Connect
//
//  Created by Lin Myat on 20/08/2021.
//
import UIKit

class CircleImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        
    }
}
