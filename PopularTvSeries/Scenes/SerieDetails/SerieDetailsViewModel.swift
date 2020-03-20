//
//  SerieDetailsViewModel.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SerieDetailsViewModel {
    
    // MARK: Properties
    
    private let service: SeriesDetailsServiceInput
    
    // MARK: Object Lifecyle
    
    init(service: SeriesDetailsServiceInput) {
        self.service = service
        service.output = self
    }
    
}

// MARK: SerieDetailsServiceOutput Interface Implementation

extension SerieDetailsViewModel: SeriesDetailsServiceOutput {
    
    func fetchSerieDetailsSucceeded(serieDetails: SerieDetails) {
        
    }
    
    func fetchSerieDetailsFailed(error: AppError) {
        
    }
    
}
