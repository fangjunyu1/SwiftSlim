//
//  LegacyMultiDatePicker.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/24.
//

import SwiftUI

struct LegacyMultiDatePicker: View {

    private let calendar = Calendar.current

    @State private var currentMonth = Date()
    @State private var selection: Set<DateComponents> = []

    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 4),
        count: 7
    )

    var body: some View {
        VStack(spacing: 12) {
            headerView

            weekdayHeaderView

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(monthCells, id: \.self) { date in
                    if let date {
                        dayButton(for: date)
                    } else {
                        Color.clear
                            .frame(height: 34)
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.secondarySystemBackground))
        )
    }

    private var headerView: some View {
        HStack {
            Text(monthTitle)
                .font(.headline)
            
            Spacer()
            
            HStack(spacing: 20) {
                Button {
                    changeMonth(by: -1)
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3.bold())
                }

                Button {
                    changeMonth(by: 1)
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title3.bold())
                }
            }
        }
    }

    private var weekdayHeaderView: some View {
        LazyVGrid(columns: columns, spacing: 4) {
            ForEach(weekdaySymbols, id: \.self) { symbol in
                Text(symbol)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .frame(height: 24)
            }
        }
    }

    private func dayButton(for date: Date) -> some View {
        let day = calendar.component(.day, from: date)
        let selected = isSelected(date)

        return Button {
            toggle(date)
        } label: {
            if Calendar.current.isDateInToday(date) {
                Text(verbatim: "\(day)")
                    .font(.system(size: 20, weight: selected ? .semibold : .regular))
                    .foregroundColor(selected ? .blue : .blue)
                    .frame(width: 30, height: 30)
                    .background(
                        Circle()
                            .fill(selected ? Color.accentColor.opacity(0.1) : Color.clear)
                    )
            } else {
                Text(verbatim: "\(day)")
                    .font(.system(size: 20, weight: selected ? .semibold : .regular))
                    .foregroundColor(selected ? .blue : .primary)
                    .frame(width: 30, height: 30)
                    .background(
                        Circle()
                            .fill(selected ? Color.accentColor.opacity(0.1) : Color.clear)
                    )
            }
        }
        .buttonStyle(.plain)
    }

    private var monthTitle: String {
        let formatter = DateFormatter()
        formatter.calendar = calendar
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy LLLL"
        return formatter.string(from: currentMonth)
    }

    private var weekdaySymbols: [String] {
        let formatter = DateFormatter()
        formatter.locale = Locale.current

        let symbols = formatter.shortStandaloneWeekdaySymbols ?? []
        guard symbols.count == 7 else { return symbols }

        let firstWeekdayIndex = calendar.firstWeekday - 1
        return Array(symbols[firstWeekdayIndex...] + symbols[..<firstWeekdayIndex])
    }

    private var monthCells: [Date?] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: currentMonth),
            let dayRange = calendar.range(of: .day, in: .month, for: currentMonth)
        else {
            return []
        }

        let firstDayOfMonth = monthInterval.start
        let weekday = calendar.component(.weekday, from: firstDayOfMonth)
        let leadingEmptyCount = (weekday - calendar.firstWeekday + 7) % 7

        let emptyCells: [Date?] = Array(repeating: nil, count: leadingEmptyCount)

        let days: [Date?] = dayRange.compactMap { day -> Date? in
            calendar.date(
                byAdding: .day,
                value: day - 1,
                to: firstDayOfMonth
            )
        }

        return emptyCells + days
    }

    private func changeMonth(by value: Int) {
        if let newMonth = calendar.date(
            byAdding: .month,
            value: value,
            to: currentMonth
        ) {
            currentMonth = newMonth
        }
    }

    private func toggle(_ date: Date) {
        let components = normalizedComponents(from: date)

        if selection.contains(components) {
            selection.remove(components)
        } else {
            selection.insert(components)
        }
    }

    private func isSelected(_ date: Date) -> Bool {
        selection.contains(normalizedComponents(from: date))
    }

    private func normalizedComponents(from date: Date) -> DateComponents {
        calendar.dateComponents([.year, .month, .day], from: date)
    }
}
