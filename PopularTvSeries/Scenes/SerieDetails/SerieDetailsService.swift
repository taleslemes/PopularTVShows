//
//  SerieDetailsService.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SerieDetailsService: SerieDetailsServiceInput {
    
    weak var output: SerieDetailsServiceOutput?
    private let api: APIProvider
    private let serieId: Int
    
    init(api: APIProvider = APICore(), serieId: Int) {
        self.api = api
        self.serieId = serieId
    }
    
    // MARK: SeriesDetailsServiceInput Interface Implementation
    
    func fetchSerieDetails() {
        api.request(url: Paths.serieDetails("\(serieId)").url) { [output] (response: Result<SerieDetails, Error>) in
            switch response {
            case .success(let serieDetails):
                output?.fetchSerieDetailsSucceeded(serieDetails: serieDetails)
            case .failure(let error):
                output?.fetchSerieDetailsFailed(error: error)
            }
        }
    }
    
    func fetchSimilarSeries() {
        api.request(url: Paths.similarSeries("\(serieId)").url) { [output] (response: Result<[SimilarSerie], Error>) in
            switch response {
            case .success(let similarSeries):
                output?.fetchSimilarSeriesSucceeded(similarSeries: similarSeries)
            case .failure(let error):
                output?.fetchSimilarSeriesFailed(error: error)
            }
        }
    }
    
}
