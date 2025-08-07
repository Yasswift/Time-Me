//
//  TimePickerView.swift
//  Time me
//
//  Created by Yassine Toutouh on 06/08/2025.
//

import SwiftUI

struct TimePickerView: View {
    @Bindable var addTimerViewModel: AddTimerViewModel

    private let pickerViewTitlePadding: CGFloat = 6

    var body: some View {
        HStack {
            pickerView(title: "heures",
                       range: TimerPickerProperties.hoursRange,
                       binding: $addTimerViewModel.selectedHoursAmount)
            pickerView(title: "min",
                       range: TimerPickerProperties.minutesRange,
                       binding: $addTimerViewModel.selectedMinutesAmount)
            pickerView(title: "sec",
                       range: TimerPickerProperties.secondsRange,
                       binding: $addTimerViewModel.selectedSecondsAmount)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
    }

    @ViewBuilder
    private func pickerView(title: String, range: ClosedRange<Int>, binding: Binding<Int>) -> some View {
        HStack(spacing: -pickerViewTitlePadding) {
            Spacer()
            Picker(title, selection: binding) {
                ForEach(range, id: \.self) { timeIncrement in
                    HStack(spacing: 0) {
                        // Forces the text in the Picker to be
                        // right-aligned
                        Spacer()
                        Text("\(timeIncrement)")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .pickerStyle(InlinePickerStyle())
            .labelsHidden()

            Text(title)
                .fontWeight(.bold)
                .lineLimit(1)
            Spacer()
        }
    }
}
