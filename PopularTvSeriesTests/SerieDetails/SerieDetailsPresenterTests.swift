//
//  SerieDetailsPresenterTests.swift
//  PopularTvSeriesTests
//
//  Created by Tales Lemes on 03/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import XCTest
@testable import PopularTvSeries

final class SerieDetailsPresentesTests: XCTestCase {
    
    private let service = SerieDetailsServiceSpy()
    private let view = SerieDetailsViewSpy()
    
    private lazy var sut = SerieDetailsPresenter(service: service)
    
    override func setUp() {
        sut.view = view
    }
    
    func test_viewDidLoad_shouldViewShowLoader() {
        sut.viewDidLoad()
        
        XCTAssertTrue(view.showLoaderCalled)
    }
    
    func test_viewDidLoad_shouldServiceFetchSerieDetails() {
        sut.viewDidLoad()
        
        XCTAssertTrue(service.fetchSerieDetailsCalled)
    }
    
    func test_viewDidLoad_shouldServiceFetchSimilarSeries() {
        sut.viewDidLoad()
        
        XCTAssertTrue(service.fetchSimilarSeriesCalled)
    }
    
    func test_fetchSimilarSeriesSucceeded_shouldViewHideLoader() {
        sut.fetchSimilarSeriesSucceeded(similarSeries: [SimilarSerie.fixture()])
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func test_fetchSimilarSeriesSucceeded_shouldViewSetSimilarSeries() {
        sut.fetchSimilarSeriesSucceeded(similarSeries: [SimilarSerie.fixture(title: "Captain America"),
                                                        SimilarSerie.fixture(title: "Iron Man"),
                                                        SimilarSerie.fixture(title: "Thor")])
        
        XCTAssertTrue(view.setSimilarSeriesCalled)
        XCTAssertEqual(view.similarSeriesPassed, "Similar TV Shows: Captain America, Iron Man, Thor")
    }
    
    func test_fetchSimilarSeriesFailed_shouldViewHideLoader() {
        sut.fetchSimilarSeriesFailed(error: AppError.generic)
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func test_fetchSimilarSeriesFailed_shouldViewShowError() {
        sut.fetchSimilarSeriesFailed(error: AppError.generic)
        
        XCTAssertTrue(view.showErrorCalled)
        XCTAssertEqual(view.errorMessagePassed, "An unexpected problem has occurred. Try again later.")
    }
    
    func test_fetchSerieDetailsSucceeded_shouldViewSetTitle() {
        sut.fetchSerieDetailsSucceeded(serieDetails: SerieDetails.fixture(title: "title name"))
        
        XCTAssertTrue(view.setTitleCalled)
        XCTAssertEqual(view.titlePassed, "title name")
    }
    
    func test_fetchSerieDetailsSucceeded_shouldViewSetPosterImage() {
        sut.fetchSerieDetailsSucceeded(serieDetails: SerieDetails.fixture(imageUrl: "imageUrl"))
        
        XCTAssertTrue(view.setPosterImageCalled)
        XCTAssertEqual(view.posterImageUrlPassed, "https://image.tmdb.org/t/p/w500/imageUrl")
    }
    
    func test_fetchSerieDetailsSucceeded_shouldViewSetOverview() {
        sut.fetchSerieDetailsSucceeded(serieDetails: SerieDetails.fixture(overview: "overview text"))
        
        XCTAssertTrue(view.setOverviewCalled)
        XCTAssertEqual(view.overviewPassed, "overview text")
    }
    
    func test_fetchSerieDetailsSucceeded_shouldViewSetVoteAverage() {
        sut.fetchSerieDetailsSucceeded(serieDetails: SerieDetails.fixture(voteAverage: 5.5))
          
          XCTAssertTrue(view.setVoteAverageCalled)
          XCTAssertEqual(view.voteAveragePassed, "Vote average: 5.5")
      }
    
    func test_fetchSerieDetailsSucceeded_givenFirstAirDateIsValid_shouldViewSetFirstAirDate() {
        sut.fetchSerieDetailsSucceeded(serieDetails: SerieDetails.fixture(firstAirDate: "2010/10/10"))
          
          XCTAssertTrue(view.setFirstAirDateCalled)
          XCTAssertEqual(view.firstAirDatePassed, "First air date: Oct 10, 2010")
      }
    
    func test_fetchSerieDetailsSucceeded_givenFirstAirDateIsNotValid_shouldViewSetFirstAirDate() {
        sut.fetchSerieDetailsSucceeded(serieDetails: SerieDetails.fixture(firstAirDate: "abc"))
        
        XCTAssertTrue(view.setFirstAirDateCalled)
        XCTAssertEqual(view.firstAirDatePassed, "First air date: no date defined")
    }
    
    func test_fetchSerieDetailsSucceeded_shouldViewSetGenres() {
        sut.fetchSerieDetailsSucceeded(serieDetails: SerieDetails.fixture(genres: [Genre(genre: "genre one"),
                                                                                   Genre(genre: "genre two")]))
        
        XCTAssertTrue(view.setGenresCalled)
        XCTAssertEqual(view.genresPassed, "Genre: genre one, genre two")
    }
  
    func test_fetchSerieDetailsFailed_shouldViewHideLoader() {
        sut.fetchSerieDetailsFailed(error: AppError.generic)
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func test_fetchSerieDetailsFailed_shouldViewShowErrorWithMessage() {
        sut.fetchSerieDetailsFailed(error: AppError.generic)
        
        XCTAssertTrue(view.showErrorCalled)
        XCTAssertEqual(view.errorMessagePassed, "An unexpected problem has occurred. Try again later.")
    }
    
}

// MARK: SerieDetailsViewSpy

final class SerieDetailsViewSpy: SerieDetailsView {
    
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
    
    private(set) var setPosterImageCalled = false
    private(set) var posterImageUrlPassed: String?
    func setPosterImage(with image: String) {
        setPosterImageCalled = true
        posterImageUrlPassed = image
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
    
    private(set) var setOverviewCalled = false
    private(set) var overviewPassed: String?
    func setOverview(with text: String) {
        setOverviewCalled = true
        overviewPassed = text
    }
    
    private(set) var setTitleCalled = false
    private(set) var titlePassed: String?
    func setTitle(with text: String) {
        setTitleCalled = true
        titlePassed = text
    }
    
    private(set) var setGenresCalled = false
    private(set) var genresPassed: String?
    func setGenres(with text: String) {
        setGenresCalled = true
        genresPassed = text
    }
    
    private(set) var setSimilarSeriesCalled = false
    private(set) var similarSeriesPassed: String?
    func setSimilarSeries(with text: String) {
        setSimilarSeriesCalled = true
        similarSeriesPassed = text
    }
    
}
