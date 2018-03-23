//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"





protocol CalendarDelegate {
    
    mutating func calendar(_ calendar: Calendar, willDisplay year: Int)
    
    func calendar(_ calendar: Calendar, didSelect date: Date)
    
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool
    
}

protocol CalendarDataSource {
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String]
    func calendar(_ calendar: Calendar, add event: String, to date: Date)
}


class Calendar {
    var delegate: CalendarDelegate?
    var dataSoure: CalendarDataSource?
    
    var selectedDate = Date()
    var currentYear = 2018
    
    func add(event: String) {
        dataSoure?.calendar(self, add: event, to: selectedDate)
    }
    
    func changeDate(to date: Date) {
        selectedDate = date
        delegate?.calendar(self, didSelect: date)
        
        if let items = dataSoure?.calendar(self, eventsFor: date) {
            print("Today's events are...")
            items.forEach { print($0) }
        } else {
            print("You have no events today.")
        }
    }
    
    func changeYear(to year: Int) {
        
        if delegate?.calendarShouldChangeYear(self) ?? true {
            delegate?.calendar(self, willDisplay: year)
            currentYear = year
        }
    }
}

struct RemindersCalendarDataSource: CalendarDataSource {
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String] {
        return ["Organize sock drawer", "Take over the world"]
    }
    
    func calendar(_ calendar: Calendar, add event: String, to date: Date) {
        print("You're going to \(event) on \(date)")
    }
}

struct RemindersCalendarDelegate: CalendarDelegate {
    
    var parentController: ReminderPresenting?
    
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool {
        return true
    }
    
    mutating func calendar(_ calendar: Calendar, willDisplay year: Int) {
        parentController?.yearChanged(to: year)
    }
    
    func calendar(_ calendar: Calendar, didSelect date: Date) {
        print("You selected \(date)")
    }
}

protocol ReminderPresenting {
    mutating func yearChanged(to year: Int)
}

struct Reminders: ReminderPresenting {
    
    var title = "Year: 2018"
    
    var calendar = Calendar()
    
    init() {
        calendar.delegate = RemindersCalendarDelegate()
        calendar.dataSoure = RemindersCalendarDataSource()
    }
    
    mutating func yearChanged(to year: Int) {
        title = "Year: \(year)"
    }
    
}




