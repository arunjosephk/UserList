//
//  PeopleViewModel.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//

import Foundation

protocol PeopleViewModelDelegate: AnyObject {
    func didFinish()
    func didfailed(with error: String)
}

class PeopleViewModel {
    
    let api = ApiManager()
    var users:[User] = []
    weak var delegate: PeopleViewModelDelegate?
    
    //MARK:- Get user data API
    func getUserData() {
        let userDetailsRequest = UserDetailsRouter.getUserDetails
        api.request(userDetailsRequest, responseType: UserData.self) { (result) in
            switch result {
            case .success(let userDetails):
                print(userDetails.user.count)
                DispatchQueue.main.async {
                    self.users = userDetails.user
                    self.delegate?.didFinish()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.delegate?.didfailed(with: error.localizedDescription)
                }
            }
        }
    }
    
    //MARK:- Check Odd
    func isOdd(index: Int)-> Bool {
        let isOdd = (index%2) != 0 ? true: false
        return isOdd
    }
    
    //MARK:- Get First Letter from string
    func getFirstLetter(string: String)-> String {
        if string.count >= 0 {
            let index = string.index(string.startIndex, offsetBy: 0)
            return String(string[index])
        }
        return ""
    }
}
