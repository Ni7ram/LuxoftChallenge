//  DateHelper.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

struct DateHelper {
    let weekDays = ["Sunday", "Monday", "Thuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    func getDayName(_ day: Int) -> String {
        return weekDays[day % 7]
    }
}
