//
//  DateFormatter.swift
//  SwiftPals
//
//  Created by Jyotsna on 29/01/20.
//  Copyright © 2020 Jyotsna. All rights reserved.
//


import Foundation

public final class DateFormatterHelper {
    
    private class func timestampConverter(_ timestamp: Double) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(timestamp / 1000))
    }
    
    public class func getDateFromTimeStamp(timestamp: Double) -> String {
        let date = timestampConverter(timestamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM YY, hh:mm a"
        dayTimePeriodFormatter.timeZone = TimeZone.current //Set timezone that you want
        dayTimePeriodFormatter.locale = NSLocale.current
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    public class func getDateWithTimeFirst(timestamp: Double) -> String {
        let date = timestampConverter(timestamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm a, dd MMM YY"
        dayTimePeriodFormatter.timeZone = TimeZone.current //Set timezone that you want
        dayTimePeriodFormatter.locale = NSLocale.current
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    public class func getDateWithFullYearAndTime(timestamp: Double) -> String {
        let date = timestampConverter(timestamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM YYYY, hh:mm a"
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    public class func getDateWithoutTime(timestamp: Double) -> String {
        let date = timestampConverter(timestamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd MMM, yyyy"
        
        dayTimePeriodFormatter.timeZone = TimeZone.current //Set timezone that you want
        dayTimePeriodFormatter.locale = NSLocale.current
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
    public class func newDateFormatter(_ timestamp: Double) -> String {
        let inputDate = timestampConverter(timestamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "d MMM, yyyy "
        let yearOldDateString = dayTimePeriodFormatter.string(from: inputDate)
        return yearOldDateString
        
    }
    
    public class func getTimeReference(inputDate: Date) -> String {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "d MMM yyyy, "
        let yearOldDateString = dayTimePeriodFormatter.string(from: inputDate)
        return yearOldDateString
       }
}


