//
//  PeopleViewController.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//

import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var userTable: UITableView!
    let viewModel = PeopleViewModel()
    
    //MARK:- Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userTable.register(cell:UserAvatarTableViewCell.self)
        userTable.register(cell: UserLetterTableViewCell.self)
        viewModel.delegate = self
        viewModel.getUserData()
    }
}

extension PeopleViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK:- UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isOdd(index: indexPath.row) {
            let cell = userTable.dequeue(cell: UserAvatarTableViewCell.self, forIndexPath: indexPath)
            cell.avatarImageView.loadImage(with: viewModel.users[indexPath.row].avatar)
            cell.nameLabel.text = viewModel.users[indexPath.row].firstName + " " + viewModel.users[indexPath.row].lastName
            return cell
        }
        else{
            let cell = userTable.dequeue(cell: UserLetterTableViewCell.self, forIndexPath: indexPath)
            cell.letterLabel.text = viewModel.getFirstLetter(string: viewModel.users[indexPath.row].firstName) + viewModel.getFirstLetter(string: viewModel.users[indexPath.row].lastName)
            cell.nameLabel.text = viewModel.users[indexPath.row].firstName + " " + viewModel.users[indexPath.row].lastName
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    //MARK:- UITableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailsViewController = UserDetailViewController.instantiate()
        userDetailsViewController.viewModel = UserDetailsViewModel(user: viewModel.users[indexPath.row], index: indexPath)
        userDetailsViewController.onUpdate = { user, indexPath in
            self.viewModel.users[indexPath.row] = user
            self.userTable.reloadRows(at: [indexPath], with: .fade)
        }
        self.navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
}

extension PeopleViewController: PeopleViewModelDelegate {
    
    func didFinish() {
        userTable.reloadData()
    }
    
    func didfailed(with error: String) {
        print(error)
    }
}

