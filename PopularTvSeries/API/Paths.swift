//
//  Paths.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

enum Urls {
    static let apiKey = "5343685ad7ec8de95ea3e9894b3b092a"
    static let popularSeriesBase = "https://api.themoviedb.org/3/tv/popular?api_key=" + Urls.apiKey + "&language=en-US&page="
    static let imageBase = "https://image.tmdb.org/t/p/w500/"
    static let serieDetailsPart1 = "https://api.themoviedb.org/3/tv/331?api_key="
    static let serieDetailsPart2 = "&language=en-US"
}
