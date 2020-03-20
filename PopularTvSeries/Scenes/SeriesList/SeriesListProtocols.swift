//
//  SeriesListProtocols.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol SeriesListServiceInput: AnyObject {
    func fetchPopularSeries(page: Int)
    var output: SeriesListServiceOutput? { get set }
}

protocol SeriesListServiceOutput: AnyObject {
    func fetchPopularSeriesSucceeded(series: [Serie])
    func fetchPopularSeriesFailed(error: AppError)
}

protocol SeriesListView: AnyObject {
    func showLoader()
    func hideLoader()
    func showError(message: String)
    func updateSeriesList()
}

protocol SeriesListRoutering: AnyObject {
    func navigateToSerieDetailsScene(serieId: Int)
}
