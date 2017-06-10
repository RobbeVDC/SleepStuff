//
//  Date+Extension.swift
//  SleepStuff
//
//  Created by Robbe Vandecasteele on 10/06/2017.
//  Copyright © 2017 Robbe Vandecasteele. All rights reserved.
//

import Foundation

extension Date {
    
    private static let hourDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    public var formattedHour: String {
        return Date.hourDateFormatter.string(from: self)
    }
    
}
