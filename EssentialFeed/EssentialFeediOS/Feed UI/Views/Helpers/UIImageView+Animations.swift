//
//  UIImageView+Animations.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/10/5.
//

import UIKit

extension UIImageView {
    func setImageAnimation(_ newImage: UIImage?) {
        image = newImage
        
        guard newImage != nil else { return }
        
        alpha = 0        
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}
