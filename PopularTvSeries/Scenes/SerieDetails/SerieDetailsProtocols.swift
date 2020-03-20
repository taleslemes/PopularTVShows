//
//  SerieDetailsProtocols.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 20/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol SeriesDetailsServiceInput: AnyObject {
    func fetchSerieDetails()
    var output: SeriesDetailsServiceOutput? { get set }
}

protocol SeriesDetailsServiceOutput: AnyObject {
    func fetchSerieDetailsSucceeded()
    func fetchSerieDetailsFailed(error: AppError)
}
