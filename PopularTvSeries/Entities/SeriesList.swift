//
//  SeriesList.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

struct SeriesResponse: Decodable {
    let results: [SeriesList]
}

struct SeriesList: Decodable {
    let id: Int
    let image: String
    let name: String
    let firstAirDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case image = "poster_path"
        case firstAirDate = "first_air_date"
    }
}
