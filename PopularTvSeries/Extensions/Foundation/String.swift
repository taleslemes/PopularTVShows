//
//  String.swift
//  PopularTvSeries
//
//  Created by Tales Lemes on 19/03/20.
//  Copyright © 2020 Tales Lemes. All rights reserved.
//

import Foundation

extension String {
    
   public func formattedDate(from initialFormat: String = "yyyy-MM-dd", to finalFormat: String = "MMM dd, yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = initialFormat
        
        guard let date = formatter.date(from: self) else { return "no date defined" }
        formatter.dateFormat = finalFormat
        
        return formatter.string(from: date)
    }
    
}
