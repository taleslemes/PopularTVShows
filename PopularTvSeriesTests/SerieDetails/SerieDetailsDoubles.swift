//
//  SerieDetailsDoubles.swift
//  PopularTvSeriesTests
//
//  Created by Tales Lemes on 03/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
@testable import PopularTvSeries

// MARK: SerieDetailsServiceSpy

final class SerieDetailsServiceSpy: SerieDetailsServiceInput {
    var output: SerieDetailsServiceOutput?
    
    private(set) var fetchSerieDetailsCalled = false
    func fetchSerieDetails() {
        fetchSerieDetailsCalled = true
    }
    
    private(set) var fetchSimilarSeriesCalled = false
    func fetchSimilarSeries() {
        fetchSimilarSeriesCalled = true
    }
    
}

// MARK: SimilarSerie Extension

extension SimilarSerie {
    static func fixture(title: String = "") -> SimilarSerie {
        return SimilarSerie(title: title)
    }
}

// MARK: SerieDetails Extension

extension SerieDetails {
    static func fixture(
        image: String = "",
        title: String = "",
        firstAirDate: String = "",
        voteAverage: Double = 0,
        overview: String = "",
        genres: [Genre] = []
    ) -> SerieDetails {
        return SerieDetails(image: image, title: title, firstAirDate: firstAirDate, voteAverage: voteAverage, overview: overview, genres: genres)
    }
}
