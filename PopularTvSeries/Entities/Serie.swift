//
//  SeriesList.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

struct SeriesResponse: Decodable {
    let results: [Serie]
}

struct Serie: Decodable {
    let id: Int
    let image: String
    let title: String
    let firstAirDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case image = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
    }
}
