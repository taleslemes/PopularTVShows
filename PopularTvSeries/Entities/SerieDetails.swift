//
//  SerieDetails.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

struct SerieDetails: Decodable {
    let image: String
    let title: String
    let firstAirDate: String
    let voteAverage: Double
    let overview: String
    let genres: [Genre]
    let similarShows: [SimilarShows]
    
    enum CodingKeys: String, CodingKey {
        case genres, overview
        case title = "name"
        case image = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case similarShows = "networks"
    }
}

struct Genre: Decodable {
    let genre: String
    
    enum CodingKeys: String, CodingKey {
        case genre = "name"
    }
}

struct SimilarShows: Decodable {
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
    }
}
