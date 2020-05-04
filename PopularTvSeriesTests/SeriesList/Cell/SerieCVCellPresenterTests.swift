//
//  SerieCVCellPresenterTests.swift
//  PopularTvSeriesTests
//
//  Created by Tales Lemes on 03/05/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import XCTest
@testable import PopularTvSeries

final class SerieCVCellPresenterTests: XCTestCase {
    
    private let view = SerieCVCellViewSpy()
    
    func test_attachView_shouldViewSetTitle() {
        let sut = SerieCVCellPresenter(model: Serie.fixture(title: "title name"))
        sut.attachView(view)
        
        XCTAssertTrue(view.setTitleCalled)
        XCTAssertEqual(view.titlePassed, "title name")
    }
    
    func test_attachView_shouldViewSetVoteAverage() {
        let sut = SerieCVCellPresenter(model: Serie.fixture(voteAverage: 7.2))
        sut.attachView(view)
        
        XCTAssertTrue(view.setVoteAverageCalled)
        XCTAssertEqual(view.voteAveragePassed, "Vote average: 7.2")
    }
    
    func test_attachView_shouldViewSetPosterImage() {
        let sut = SerieCVCellPresenter(model: Serie.fixture(imageUrl: "imageUrl"))
        sut.attachView(view)
        
        XCTAssertTrue(view.setPosterImageCalled)
        XCTAssertEqual(view.posterImageUrlPassed, "\(Urls.imageBase)imageUrl")
    }
    
    func test_attachView_givenFirstAirDateIsValid_shouldViewSetFirstAirDate() {
        let sut = SerieCVCellPresenter(model: Serie.fixture(firstAirDate: "2005/12/28"))
        sut.attachView(view)
        
        XCTAssertTrue(view.setFirstAirDateCalled)
        XCTAssertEqual(view.firstAirDatePassed, "First air date: Dec 28, 2005")
    }
    
    func test_attachView_givenFirstAirDateIsNotValid_shouldViewSetFirstAirDate() {
        let sut = SerieCVCellPresenter(model: Serie.fixture(firstAirDate: ""))
        sut.attachView(view)
        
        XCTAssertTrue(view.setFirstAirDateCalled)
        XCTAssertEqual(view.firstAirDatePassed, "First air date: no date defined")
    }
    
}
