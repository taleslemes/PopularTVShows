//
//  UIView.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

struct Corners: OptionSet {
    let rawValue: Int
    
    static let top = Corners(rawValue: 1 << 0)
    static let left = Corners(rawValue: 1 << 1)
    static let bottom = Corners(rawValue: 1 << 2)
    static let right = Corners(rawValue: 1 << 3)
    static let zero = Corners(rawValue: 1 << 4)
    static let all = Corners(rawValue: 1 << 5)
    
    var mask: CACornerMask {
        var mask: CACornerMask = []
        
        if contains(.zero) {
            return mask
        }
        
        if contains(.all) {
            mask.update(with: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
        }
        
        if contains(.top) {
            mask.update(with: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        }
        
        if contains(.left) {
            mask.update(with: [.layerMinXMaxYCorner, .layerMinXMinYCorner])
        }
        
        if contains(.bottom) {
            mask.update(with: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        }
        
        if contains(.right) {
            mask.update(with: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner])
        }
        
        return mask
    }
}

extension UIView {
    
    func cornerOn(_ corners: Corners, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners.mask
    }
    
    func setShadow(shadowColor: UIColor = .black, shadowOpacity: Float = 0.3, shadowRadius: CGFloat = 10, shadowOffset: CGSize = CGSize(width: 0, height: 1)) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.masksToBounds = false
    }
    
}
