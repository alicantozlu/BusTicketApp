//
//  Date+Extension.swift
//  BussTicketApp
//
//  Created by Ali Can Tozlu on 20.02.2022.
//

import Foundation

extension Date {
    var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
}
