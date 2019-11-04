//
//  Date+Random.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

extension Date {
    
    static func randomTimeToday() -> Date {
        let currentDate = Date()
        
        let minutesInHour = 60
        let hoursInDay = 24
        let seccondsInMinute = 60
        let seccondsInDay = (minutesInHour * hoursInDay) * seccondsInMinute
        
        let rand: Double = Double(Int.random(in: 0..<seccondsInDay))
        let newDateEpoch = (currentDate.timeIntervalSince1970 / 1000) - rand

        return Date(timeIntervalSince1970: newDateEpoch)
    }
}
