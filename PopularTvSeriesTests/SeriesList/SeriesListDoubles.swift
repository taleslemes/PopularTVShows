//
//  SeriesListDoubles.swift
//  PopularTvSeriesTests
//
//  Created by Tales Lemes on 03/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation
@testable import PopularTvSeries

// MARK: SeriesListViewSpy

final class SeriesListViewSpy: SeriesListView {
    
    private(set) var showLoaderCalled = false
    func showLoader() {
        showLoaderCalled = true
    }
    
    private(set) var hideLoaderCalled = false
    func hideLoader() {
        hideLoaderCalled = true
    }
    
    private(set) var showErrorCalled = false
    private(set) var errorMessagePassed: String?
    func showError(message: String) {
        showErrorCalled = true
        errorMessagePassed = message
    }
    
    private(set) var updateSeriesListCalled = false
    func updateSeriesList() {
        updateSeriesListCalled = true
    }
    
}

// MARK: SeriesListServiceSpy

final class SeriesListServiceSpy: SeriesListServiceInput {
    var output: SeriesListServiceOutput?
    
    private(set) var fetchPopularSeriesCalled = false
    private(set) var pageNumberPassed: Int?
    func fetchPopularSeries(page: Int) {
        fetchPopularSeriesCalled = true
        pageNumberPassed = page
    }
    
}

// MARK: SeriesListRouterSpy

final class SeriesListRouterSpy: SeriesListRoutering {
    
    private(set) var navigateToSerieDetailsSceneCalled = false
    private(set) var serieIdPassed: Int?
    func navigateToSerieDetailsScene(serieId: Int) {
        navigateToSerieDetailsSceneCalled = true
        serieIdPassed = serieId
    }
    
}

// MARK: Serie Extension

extension Serie {
    static func fixture(
        id: Int = 0,
        image: String = "",
        title: String = "",
        firstAirDate: String = "",
        voteAverage: Double = 0
    ) -> Serie {
        return Serie(id: id, image: image, title: title, firstAirDate: firstAirDate, voteAverage: voteAverage)
    }
}
