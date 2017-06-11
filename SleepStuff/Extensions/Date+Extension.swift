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
    
    /// Date by changing value of calendar component.
    ///
    /// - Parameters:
    ///   - component: component type.
    ///   - value: new value of compnenet to change.
    /// - Returns: original date after changing given component to given value.
    public func changing(_ component: Calendar.Component, value: Int) -> Date? {
        return Calendar.current.date(bySetting: component, value: value, of: self)
    }
}
