//
//  SerieDetailsRouter.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import UIKit

final class SerieDetailsRouter {
    
    private let serieId: Int
    
    init(serieId: Int) {
        self.serieId = serieId
    }
    
    func makeViewController() -> UIViewController {
        let service = SerieDetailsService(serieId: serieId)
        let presenter = SerieDetailsPresenter(service: service)
        let viewController = SerieDetailsViewController(presenter: presenter)
        
        return viewController
    }
    
}
