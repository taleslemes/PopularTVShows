//
//  ActivityIndicator.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class ActivityIndicator: UIActivityIndicatorView {
    
    private var loaderColor: UIColor?
    
    init(frame: CGRect, loaderColor: UIColor) {
        super.init(frame: UIScreen.main.bounds)
        
        self.loaderColor = loaderColor
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        setup()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.color = loaderColor
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
    }
    
}
