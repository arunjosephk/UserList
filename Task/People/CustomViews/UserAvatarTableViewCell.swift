//
//  UserTableViewCell.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//

import UIKit

class UserAvatarTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    //MARK:- Styling
    func setupStyle() {
        self.selectionStyle = .none
        containerView.layer.cornerRadius = containerView.frame.size.height/2
    }
}
