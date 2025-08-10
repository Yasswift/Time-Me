//
//  TimerItemView.swift
//  Time me
//
//  Created by Yassine Toutouh on 06/08/2025.
//

import SwiftUI

struct TimerItemView: View {
    @State private var timerViewModel: TimerViewModel

    init(timerModel: TimerModel) {
        self._timerViewModel = State(initialValue: TimerViewModel(timerModel: timerModel))
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(timerViewModel.remainingTime.formatTimeInterval())
                    .font(Font.system(size: 34))
                    .foregroundColor(.secondary)
                    .overlay(alignment: .bottom) {
                        Divider()
                            .frame(height: 4)
                            .background(Color.orange)
                            .offset(y: 8)
                    }
                    .padding(.bottom, 16)
                Text(timerViewModel.timerModel.name)
                    .font(Font.system(size: 26))
                    .lineLimit(1)
            }
            .frame(height: 80)
            Spacer()
            Button {
                timerViewModel.updateTimer()
            } label: {
                Circle()
                    .fill(timerViewModel.timerState.backgroundColor)
                    .frame(width: 60, height: 60)
                    .overlay {
                        Image(systemName: timerViewModel.timerState.icon)
                            .font(Font.system(size: 30))
                            .foregroundStyle(timerViewModel.timerState.foregroundColor)
                    }
            }
            .buttonStyle(.plain)
        }
    }
}
