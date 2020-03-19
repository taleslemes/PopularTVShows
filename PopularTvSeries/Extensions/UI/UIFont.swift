//
//  UIFont.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum IBMPlexSansFontWeight {
        case bold
        case regular
        
        var systemFontWeight: UIFont.Weight {
            switch self {
            case .bold:
                return .bold
            case .regular:
                return .regular
            }
        }
    }
    
    static func IBMPlexSans(withWeight weight: IBMPlexSansFontWeight, size: CGFloat) -> UIFont {
        switch weight {
        case .bold:
            return UIFont(name: "IBMPlexSans-Bold", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        case .regular:
            return UIFont(name: "IBMPlexSans", size: size) ?? .systemFont(ofSize: size, weight: weight.systemFontWeight)
        }
    }
}

