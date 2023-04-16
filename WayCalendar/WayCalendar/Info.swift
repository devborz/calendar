//
//  Info.swift
//  WayCalendar
//
//  Created by Усман Туркаев on 21.04.2021.
//

import Foundation

public enum Months: Int {
    case january = 1
    case febrary = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12
}

func getCountOfDayFor(_ month: Int, year: Int) -> Int {
    guard month <= 12 else { return 0 }
    
    let dateComponents = DateComponents(year: year, month: month)
    let calendar = Calendar.current
    let date = calendar.date(from: dateComponents)!

    let range = calendar.range(of: .day, in: .month, for: date)!
    return range.count
}
