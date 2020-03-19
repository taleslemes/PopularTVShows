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
    
    func fetchPopularSeries(page: Int) {
        api.request(url: Urls.popularSeriesBase + "\(page)", success: { [output] (series: SeriesResponse) in
            output?.fetchPopularSeriesSucceeded(series: series.results)
        }) { [output] (error) in
            output?.fetchPopularSeriesFailed(error: error)
        }
    }
    
}
