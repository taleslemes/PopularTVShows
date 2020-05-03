//
//  Device.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

struct Device {
    static private let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    static private let isIphone = UIDevice.current.userInterfaceIdiom == .phone
    static private let isRetina = UIScreen.main.scale >= 2.0

    static private let screenWidth = Int(UIScreen.main.bounds.size.width)
    static private let screenHeight = Int(UIScreen.main.bounds.size.height)
    static private let screenMaxLength = Int(max(screenWidth, screenHeight))
    static private let screenMinLength = Int(min(screenWidth, screenHeight))

    // iPhone 5, 5s, 5c, SE
    static let isIphoneSE = isIphone && screenMaxLength == 568
    
    // iPhone 6, 6s, 7, 8
    static let isIphone8 = isIphone && screenMaxLength == 667
    
    // iPhone 6+, 6s+, 7+, 8+,
    static let isIphone8Plus = isIphone && screenMaxLength == 736
    
    // iPhone X, Xs, 11pro
    static let isIphoneX = isIphone && screenMaxLength == 812
    
    // iphone 11, Xr, 11proMax, XsMax
    static let isIphone11 = isIphone && screenMaxLength == 896
}
