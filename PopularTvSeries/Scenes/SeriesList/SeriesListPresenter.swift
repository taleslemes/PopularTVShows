//
//  SeriesListPresenter.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SeriesListPresenter {
    
    // MARK: Properties
    
    let title = "Popular TV Series"
    var series = [Serie]()
    
    var currentPage: Int = 1
    var isLoadingList: Bool = false
    
    private let service: SeriesListServiceInput
    private let router: SeriesListRoutering
    weak var view: SeriesListView?
    
    // MARK: Object Lifecycle
    
    init(service: SeriesListServiceInput, router: SeriesListRoutering) {
        self.service = service
        self.router = router
        service.output = self
    }
    
    // MARK: Public Methods
    
    func viewDidLoad() {
        view?.showLoader()
        fetchPopularSeries(currentPage: currentPage)
        currentPage += 1
    }
    
    func fetchPopularSeries(currentPage: Int) {
        service.fetchPopularSeries(page: currentPage)
    }
    
    func didSelectItemAt(index: Int) {
        let selectedSerieId = series[index].id
        router.navigateToSerieDetailsScene(serieId: selectedSerieId)
    }
    
}

// MARK: SeriesListServiceOutput Interface Implementation

extension SeriesListPresenter: SeriesListServiceOutput {
    
    func fetchPopularSeriesSucceeded(series: [Serie]) {
        for serie in series {
            self.series.append(serie)
        }
        
        view?.hideLoader()
        view?.updateSeriesList()
    }
    
    func fetchPopularSeriesFailed(error: Error) {
        view?.hideLoader()
        view?.showError(message: error.localizedDescription)
    }
    
}
