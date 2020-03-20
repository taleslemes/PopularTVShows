//
//  SimilarSerie.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

struct SimilarSeriesResponse: Decodable {
    let results: [SimilarSerie]
}

struct SimilarSerie: Decodable {
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
    }
}
