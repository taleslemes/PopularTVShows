//
//  SerieDetailsProtocols.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol SeriesDetailsServiceInput: AnyObject {
    func fetchSerieDetails()
    func fetchSimilarSeries()
    var output: SeriesDetailsServiceOutput? { get set }
}

protocol SeriesDetailsServiceOutput: AnyObject {
    func fetchSerieDetailsSucceeded(serieDetails: SerieDetails)
    func fetchSerieDetailsFailed(error: Error)
    func fetchSimilarSeriesSucceeded(similarSeries: [SimilarSerie])
    func fetchSimilarSeriesFailed(error: Error)
}

protocol SeriesDetailsView: AnyObject {
    func showLoader()
    func hideLoader()
    func showError(message: String)
    func setPosterImage(with image: String)
    func setVoteAverage(with text: String)
    func setFirstAirDate(with text: String)
    func setOverview(with text: String)
    func setTitle(with text: String)
    func setGenres(with text: String)
    func setSimilarSeries(with text: String)
}
