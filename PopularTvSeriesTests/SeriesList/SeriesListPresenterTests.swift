//
//  SeriesListPresenterTests.swift
//  PopularTvSeriesTests
//
//  Created by Tales Lemes on 26/04/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import XCTest
@testable import PopularTvSeries

final class PopularTvSeriesTests: XCTestCase {
    
    private let view = SeriesListViewSpy()
    private let service = SeriesListServiceSpy()
    private let router = SeriesListRouterSpy()
    
    private lazy var sut = SeriesListPresenter(service: service, router: router)
    
    override func setUp() {
        sut.view = view
    }
    
    func test_viewDidLoad_shouldViewShowLoader() {
        sut.viewDidLoad()
        
        XCTAssertTrue(view.showLoaderCalled)
    }
    
    func test_viewDidLoad_shouldServiceFetchPopularSeriesOnFirstPage() {
        sut.viewDidLoad()
        
        XCTAssertTrue(service.fetchPopularSeriesCalled)
        XCTAssertEqual(service.pageNumberPassed, 1)
    }
    
    func test_fetchPopularSeries_shouldServiceFetchPopularSeriesOnCurrentPage() {
        sut.fetchPopularSeries(currentPage: 5)
        
        XCTAssertTrue(service.fetchPopularSeriesCalled)
        XCTAssertEqual(service.pageNumberPassed, 5)
    }
    
    func test_didSelectItemAt_shouldRouterNavigateToSerieDetailsScene() {
        sut.series = [Serie.fixture(id: 4),
                      Serie.fixture(id: 12),
                      Serie.fixture(id: 89),
                      Serie.fixture(id: 10),
                      Serie.fixture(id: 40),
                      Serie.fixture(id: 54),
                      Serie.fixture(id: 2),
                      Serie.fixture(id: 98),
                      Serie.fixture(id: 74)]
        
        sut.didSelectItemAt(index: 3)
        
        XCTAssertTrue(router.navigateToSerieDetailsSceneCalled)
        XCTAssertEqual(router.serieIdPassed, 10)
    }
    
    func test_fetchPopularSeriesSucceeded_shouldViewHideLoader() {
        sut.fetchPopularSeriesSucceeded(series: [Serie.fixture()])
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func test_fetchPopularSeriesSucceeded_shouldViewUpdateSeriesList() {
        sut.fetchPopularSeriesSucceeded(series: [Serie.fixture()])
        
        XCTAssertTrue(view.updateSeriesListCalled)
    }
    
    func test_fetchPopularSeriesFailed_shouldViewHideLoader() {
        sut.fetchPopularSeriesFailed(error: AppError.generic)
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func test_fetchPopularSeriesFailed_shouldViewShowErrorWithMessage() {
        sut.fetchPopularSeriesFailed(error: AppError.generic)
        
        XCTAssertTrue(view.showErrorCalled)
        XCTAssertEqual(view.errorMessagePassed, "An unexpected problem has occurred. Try again later.")
    }
    
}
