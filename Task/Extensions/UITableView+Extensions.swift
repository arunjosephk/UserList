//
//  UITableView+Extensions.swift
//  Task
//
//  Created by Arun Joseph K on 27/04/21.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(cell nib: UITableViewCell.Type) {
        let cellNib = UINib(nibName: String(describing: nib), bundle: nil)
        register(cellNib, forCellReuseIdentifier: String(describing: nib))
    }
    
    func register(headerFooter nib: UITableViewHeaderFooterView.Type) {
        let viewNib = UINib(nibName: String(describing: nib), bundle: nil)
        register(viewNib, forHeaderFooterViewReuseIdentifier: String(describing: nib))
    }
    
    func dequeue<T: UITableViewCell>(cell type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        let identifier = String(describing: type.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Check if cell identifier and class name are same")
        }
        return cell
    }
}
