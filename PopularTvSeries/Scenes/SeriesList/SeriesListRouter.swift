//
//  SeriesListRouter.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class SeriesListRouter {
    
    private weak var context: UIViewController?
    
    func makeViewController() -> UIViewController {
        let router = self
        let service = SeriesListService()
        let presenter = SeriesListPresenter(service: service, router: router)
        let viewController = SeriesListViewController(presenter: presenter)
        
        context = viewController
        
        return viewController
    }
    
}

// MARK: SerieListRoutering Interface Implementation

extension SeriesListRouter: SeriesListRoutering {
    
    func navigateToSerieDetailsScene(serieId: Int) {
        let router = SerieDetailsRouter(serieId: serieId)
        context?.navigationController?.pushViewController(router.makeViewController(), animated: true)
    }
    
}
