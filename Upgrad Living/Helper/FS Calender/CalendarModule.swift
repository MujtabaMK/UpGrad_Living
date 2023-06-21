//
//  CalendarModule.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 13/06/23.
//

import SwiftUI
import FSCalendar

struct FSCalendarView: UIViewRepresentable {
    @Binding var selectedDates: [Date]
    @Binding var dateRange: ClosedRange<Date>?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {
        uiView.reloadData()

        if let startDate = dateRange?.lowerBound, let endDate = dateRange?.upperBound {
            let calendar = Calendar.current
            if let startDateComponents = calendar.dateComponents([.year, .month, .day], from: startDate).date,
               let endDateComponents = calendar.dateComponents([.year, .month, .day], from: endDate).date {
                let range = calendar.dateRange(from: startDateComponents, to: endDateComponents)
                for date in range {
                    uiView.select(date)
                }
            }
        }
    }

    class Coordinator: NSObject, FSCalendarDelegate {
        let parent: FSCalendarView

        init(_ parent: FSCalendarView) {
            self.parent = parent
        }

        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            if let startDate = parent.dateRange?.lowerBound, let endDate = parent.dateRange?.upperBound {
                if date < startDate || date > endDate {
                    parent.dateRange = date...date
                } else {
                    parent.dateRange = startDate...date
                }
            } else {
                parent.dateRange = date...date
            }
            parent.selectedDates.append(date)
        }

        func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
            if let index = parent.selectedDates.firstIndex(of: date) {
                parent.selectedDates.remove(at: index)
            }
        }
    }
}

extension Calendar {
    func dateRange(from startDate: Date, to endDate: Date) -> [Date] {
        var dates: [Date] = []
        var currentDate = startDate

        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = self.date(byAdding: .day, value: 1, to: currentDate)!
        }

        return dates
    }
}

