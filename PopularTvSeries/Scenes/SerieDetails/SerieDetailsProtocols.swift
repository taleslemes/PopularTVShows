//
//  SerieDetailsProtocols.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol SerieDetailsServiceInput: AnyObject {
    func fetchSerieDetails()
    func fetchSimilarSeries()
    var output: SerieDetailsServiceOutput? { get set }
}

protocol SerieDetailsServiceOutput: AnyObject {
    func fetchSerieDetailsSucceeded(serieDetails: SerieDetails)
    func fetchSerieDetailsFailed(error: Error)
    func fetchSimilarSeriesSucceeded(similarSeries: [SimilarSerie])
    func fetchSimilarSeriesFailed(error: Error)
}

protocol SerieDetailsView: AnyObject {
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
