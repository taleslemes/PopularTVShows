//
//  SeriesCVCellViewModel.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 18/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

final class SeriesCVCellViewModel {
    
    // MARK: Properties
    
    private weak var view: SeriesCVCellView?
    
    // MARK: Public Methods
    
    func attachView(_ view: SeriesCVCellView) {
        self.view = view
        
    }
    
}
