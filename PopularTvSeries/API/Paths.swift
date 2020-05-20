//
//  Paths.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

enum Paths {
    static let apiKey = "5343685ad7ec8de95ea3e9894b3b092a"
    static let baseUrl = "https://api.themoviedb.org/3/tv/"
    
    case popularSeries(String)
    case imageBase(String)
    case serieDetails(String)
    case similarSeries(String)
    
    var url: String {
        switch self {
        case .popularSeries(let pageNumber):
            return Paths.baseUrl + "popular?api_key=" + Paths.apiKey + "&language=en-US&page=" + pageNumber
        case .serieDetails(let serieId):
            return Paths.baseUrl + serieId + "?api_key=" + Paths.apiKey + "&language=en-US"
        case .similarSeries(let serieId):
            return Paths.baseUrl + serieId + "/similar?api_key=" + Paths.apiKey + "&language=en-US&page=1"
        case .imageBase(let imageUrl):
            return "https://image.tmdb.org/t/p/w500/" + imageUrl
        }
    }
    
}
