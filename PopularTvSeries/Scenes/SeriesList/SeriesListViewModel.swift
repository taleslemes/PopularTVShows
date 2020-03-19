//
//  SeriesListViewModel.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SeriesListViewModel {
    
    // MARK: Properties
    
    let title = "Popular TV Series"
    var page = 1
    var series = [Serie]()
    
    private let service: SeriesListServiceInput
    weak var view: SeriesListView?
    
    // MARK: Object Lifecycle
    
    init(service: SeriesListServiceInput) {
        self.service = service
        service.output = self
    }
    
    // MARK: Public Methods
    
    func viewDidLoad() {
        view?.showLoader()
        service.fetchPopularSeries(page: page)
    }
    
}

// MARK: SeriesListService Output Interface Implementation

extension SeriesListViewModel: SeriesListServiceOutput {
    
    func fetchPopularSeriesSucceeded(series: [Serie]) {
        self.series = series
        view?.hideLoader()
        view?.updateSeriesList()
    }
    
    func fetchPopularSeriesFailed(error: AppError) {
        view?.hideLoader()
        view?.showError(message: error.description)
    }
    
}
