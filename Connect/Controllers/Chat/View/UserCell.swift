//
//  UserCell.swift
//  Connect
//
//  Created by MAC on 20/08/2021.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewShadow(bgView)
        selectionStyle = .none
    }
    
    func viewShadow(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 3)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 1
    }
}
