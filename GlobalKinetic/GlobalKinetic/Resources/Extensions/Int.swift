//
//  Int.swift
//  GlobalKinetic
//
//  Created by Roberto Ferro on 2018/11/04.
//  Copyright © 2018 Roberto Ferro. All rights reserved.
//

import Foundation

extension Int {
    
    func format(with localized:String) -> String {
        let localizedPlural = self == 1 ? localized : localized + "s"
        return String(format: localizedPlural.localized(), self )
    }
    
    func toString() -> String {
        return "\(self)"
    }
    
    func formatUnixTime(using dateFormat:String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    
    func formatOrdinalDate() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let calendar = Calendar.current
        let dateComponents = calendar.component(.day, from: date)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        let day = numberFormatter.string(from: dateComponents as NSNumber)
        return day ?? ""
    }
    
    func formateForAskedByDate() -> String {
        let monthYear = self.formatUnixTime(using: "MMMM yyyy")
        let hoursMinutes = self.formatUnixTime(using: "HH:mm")
        let ordinalDay = self.formatOrdinalDate()
        return String(format: "askedByDateAndTime", ordinalDay,hoursMinutes,monthYear)
    }
    
}
