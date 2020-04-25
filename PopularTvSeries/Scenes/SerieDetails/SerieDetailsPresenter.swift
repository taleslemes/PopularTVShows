//
//  SerieDetailsPresenter.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SerieDetailsPresenter {
    
    // MARK: Properties
    
    weak var view: SeriesDetailsView?
    private let service: SeriesDetailsServiceInput
    
    let title = "Serie Details"
    
    // MARK: Object Lifecyle
    
    init(service: SeriesDetailsServiceInput) {
        self.service = service
        service.output = self
    }
    
    // MARK: Public Methods
    
    func viewDidLoad() {
        view?.showLoader()
        service.fetchSerieDetails()
        service.fetchSimilarSeries()
    }
    
}

// MARK: SerieDetailsServiceOutput Interface Implementation

extension SerieDetailsPresenter: SeriesDetailsServiceOutput {
    
    func fetchSimilarSeriesSucceeded(similarSeries: [SimilarSerie]) {
        
        /// getting similar TV Shows information from server takes a little longer, therefore the loader should disappear after it is succeeded
        view?.hideLoader()
        
        var seriesArray = [String]()
        for serie in similarSeries {
            seriesArray.append(serie.title)
        }
        let similarSeries = seriesArray.joined(separator: ", ")
        
        view?.setSimilarSeries(with: "Similar TV Shows: \(similarSeries)")
    }
    
    func fetchSimilarSeriesFailed(error: Error) {
        view?.hideLoader()
        view?.showError(message: error.localizedDescription)
    }
        
    func fetchSerieDetailsSucceeded(serieDetails: SerieDetails) {
        view?.setTitle(with: serieDetails.title)
        view?.setPosterImage(with: Urls.imageBase + serieDetails.image)
        view?.setOverview(with: serieDetails.overview)
        view?.setVoteAverage(with: "Vote average: \(serieDetails.voteAverage)")
        view?.setFirstAirDate(with: "First air date: \(serieDetails.firstAirDate.formattedDate())")
        
        var genresArray = [String]()
        for genre in serieDetails.genres {
            genresArray.append(genre.genre)
        }
        let genres = genresArray.joined(separator: ", ")
        
        view?.setGenres(with: "Genre: \(genres)")
    }
    
    func fetchSerieDetailsFailed(error: Error) {
        view?.hideLoader()
        view?.showError(message: error.localizedDescription)
    }
    
}
