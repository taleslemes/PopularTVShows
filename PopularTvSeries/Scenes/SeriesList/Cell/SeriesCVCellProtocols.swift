//
//  SerieCVCellProtocols.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

protocol SerieCVCellView: AnyObject {
    func setPosterImage(with imageUrl: String)
    func setTitle(with text: String)
    func setVoteAverage(with text: String)
    func setFirstAirDate(with text: String)
}
