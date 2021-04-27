//
//  UserLetterTableViewCell.swift
//  Task
//
//  Created by Arun Joseph K on 28/04/21.
//

import UIKit

class UserLetterTableViewCell: UITableViewCell {

    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    //MARK:- Styling
    func setupStyle() {
        self.selectionStyle = .none
        containerView.layer.cornerRadius = containerView.frame.size.height/2
        letterLabel.layer.cornerRadius = letterLabel.frame.size.height/2
    }
    
}
