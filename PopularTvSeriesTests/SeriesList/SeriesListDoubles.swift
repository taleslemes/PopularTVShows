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

// MARK: SerieCVCellViewSpy

final class SerieCVCellViewSpy: SerieCVCellView {
    
    private(set) var setPosterImageCalled = false
    private(set) var posterImageUrlPassed: String?
    func setPosterImage(with imageUrl: String) {
        setPosterImageCalled = true
        posterImageUrlPassed = imageUrl
    }
    
    private(set) var setTitleCalled = false
    private(set) var titlePassed: String?
    func setTitle(with text: String) {
        setTitleCalled = true
        titlePassed = text
    }
    
    private(set) var setVoteAverageCalled = false
    private(set) var voteAveragePassed: String?
    func setVoteAverage(with text: String) {
        setVoteAverageCalled = true
        voteAveragePassed = text
    }
    
    private(set) var setFirstAirDateCalled = false
    private(set) var firstAirDatePassed: String?
    func setFirstAirDate(with text: String) {
        setFirstAirDateCalled = true
        firstAirDatePassed = text
    }
    
}

// MARK: Serie Extension

extension Serie {
    static func fixture(id: Int = 0,
                        imageUrl: String = "",
                        title: String = "",
                        firstAirDate: String = "",
                        voteAverage: Double = 0) -> Serie {
        return Serie(id: id, imageUrl: imageUrl, title: title, firstAirDate: firstAirDate, voteAverage: voteAverage)
    }
}
