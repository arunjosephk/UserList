//
//  UIIMageVIew+Extensions.swift
//  Task
//
//  Created by Arun Joseph K on 28/04/21.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    func loadImage(with urlString: String) {
        let placeholder = UIImage(named: Constants.Placeholders.commonPlaceholderImage)! //image named commonPlaceholderImage must be in assets..
        guard let imageUrl = URL(string: urlString) else{self.image = placeholder; return}
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_imageIndicator?.startAnimatingIndicator()
        sd_setImage(with: imageUrl) { (image, error, cacheType, url) in
            self.sd_imageIndicator?.stopAnimatingIndicator()
            self.image = image != nil ? image: placeholder
        }
    }
}


