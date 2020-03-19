//
//  Loader.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

struct Loader {
    static private var loader: UIActivityIndicatorView?
    
    static func show(in context: UIViewController, color: UIColor = .customGreen) {
        guard self.loader == nil else { return }
        let loader = ActivityIndicator(frame: .zero, loaderColor: color)
        self.loader = loader
        
        DispatchQueue.main.async {
            context.view.addSubview(loader)
            loader.startAnimating()
        }
    }
    
    static func hide() {
        guard let loader = loader else { return }
        
        DispatchQueue.main.async {
            loader.stopAnimating()
            self.loader?.removeFromSuperview()
        }
        
        self.loader = nil
    }
}

