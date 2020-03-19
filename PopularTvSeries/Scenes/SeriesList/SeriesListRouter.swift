//
//  SeriesListRouter.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class SeriesListRouter {
    
    func makeViewController() -> UINavigationController {
        let viewModel = SeriesListViewModel()
        let viewController = SeriesListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        return navigationController
    }
    
}
