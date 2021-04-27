//
//  UserDetailViewController.swift
//  Task
//
//  Created by Arun Joseph K on 28/04/21.
//

import Foundation
import UIKit
import SDWebImage

typealias UpdateUserDetails = ((_ user: User, _ index: IndexPath)->Void)

class UserDetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    static var storyboardName: String{Constants.Storyboards.main}
    var onUpdate:UpdateUserDetails?
    var viewModel: UserDetailsViewModel?
    
    //MARK:- Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUserData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let onUpdate = self.onUpdate, let viewModel = self.viewModel else{return}
        viewModel.user.firstName = firstName.text ?? ""
        viewModel.user.lastName = lastName.text ?? ""
        onUpdate(viewModel.user, viewModel.index)
    }
    
    //MARK:- Styling
    func setupStyle() {
        avatarImageView.layer.cornerRadius = 30
    }
    
    //MARK:- Set data
    func setUserData() {
        guard let viewModel = viewModel else{return}
        self.avatarImageView.loadImage(with: viewModel.user.avatar)
        self.firstName.text = viewModel.user.firstName
        self.lastName.text = viewModel.user.lastName
    }
}
