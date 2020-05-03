//
//  AppError.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

enum AppError {
    case generic
}

extension AppError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .generic:
            return "An unexpected problem has occurred. Try again later."
        }
    }    
}
