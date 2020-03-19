//
//  AppError.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

enum AppError: Error {
    case generic
}

extension AppError {
    
    var description: String {
        switch self {
        case .generic:
            return "Um problema inesperado ocorreu. Por favor, tente novamente."
        }
    }
    
}
