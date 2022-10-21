//  DateHelper.swift
//  Challenge
//  Created by Martin Cardozo on 19/10/2022.

struct DateHelper {
    let weekDays = ["Sunday", "Monday", "Thuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    func getDayName(_ day: Int) -> String {
        guard day >= 0 else { return "" }
        
        var intDay = day
        
        while intDay > 6 {
            intDay = intDay - 7
        }
        
        return weekDays[intDay]
    }
}
