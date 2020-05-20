//
//  SeriesListService.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SeriesListService: SeriesListServiceInput {
    
    weak var output: SeriesListServiceOutput?
    private let api: APIProvider
    
    init(api: APIProvider = APICore()) {
        self.api = api
    }
    
    // MARK: SeriesListServiceInput Interface Implementation
    
    func fetchPopularSeries(page: Int) {
        api.request(url: Paths.popularSeries("\(page)").url) { [output] (response: Result<SeriesResponse, Error>) in
            switch response {
            case .success(let seriesResponse):
                output?.fetchPopularSeriesSucceeded(series: seriesResponse.results)
            case .failure(let error):
                output?.fetchPopularSeriesFailed(error: error)
            }
        }
    }
    
}
