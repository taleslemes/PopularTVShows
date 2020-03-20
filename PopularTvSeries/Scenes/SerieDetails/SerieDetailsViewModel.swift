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
    }
    
}

// MARK: SerieDetailsServiceOutput Interface Implementation

extension SerieDetailsViewModel: SeriesDetailsServiceOutput {
    
    func fetchSerieDetailsSucceeded(serieDetails: SerieDetails) {
        view?.hideLoader()
        
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
    
    func fetchSerieDetailsFailed(error: AppError) {
        view?.hideLoader()
        view?.showError(message: error.description)
    }
    
}
