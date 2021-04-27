//
//  Storyboarded.swift
//  Task
//
//  Created by Arun Joseph K on 28/04/21.
//

import Foundation
import UIKit

protocol Storyboarded {
    static var storyboardName: String { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        let className = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("Failed to instantiate viewcontroller. Check storyboard name and view controller identifier")
        }
        return viewController
    }
}
