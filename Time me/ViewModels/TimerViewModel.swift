//
//  TimerViewModel.swift
//  Time me
//
//  Created by Yassine Toutouh on 06/08/2025.
//

import Combine
import SwiftUI

extension TimerViewModel {
    enum TimerState {
        case running
        case paused
        case set

        var icon: String {
            return switch self {
            case .running: "pause.fill"
            default: "play.fill"
            }
        }

        var backgroundColor: Color {
            return foregroundColor.opacity(0.2)
        }

        var foregroundColor: Color {
            return switch self {
            case .running: Color.orange
            default: Color.green
            }
        }

        var isRunning: Bool {
            return self == .running
        }

        var isActive: Bool {
            self == .running || self == .paused
        }

        var isIdle: Bool {
            self == .set
        }
    }
}

@Observable
class TimerViewModel {
    var timer: Timer?
    var timerState: TimerState = .set

    var remainingTime: TimeInterval = 0
    var startTime: Date?
    var pausedTimeInterval: TimeInterval = 0

    var timerCancellable: AnyCancellable?

    @ObservationIgnored let timerModel: TimerModel

    init(timerModel: TimerModel) {
        self.timerModel = timerModel
        self.remainingTime = timerModel.timestamp
    }

    func updateTimer() {
        guard timerState.isRunning else {
            startTimer()
            return
        }

        timerState = .paused
        pausedTimeInterval += Date().timeIntervalSince(startTime ?? Date())
        timer?.invalidate()
    }

    private func startTimer() {
        startTime = Date()
        timerState = .running
        pausedTimeInterval = 0

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            guard let startTime = self.startTime else { return }

            let elapsed = self.pausedTimeInterval + Date().timeIntervalSince(startTime)
            let remaining = max(self.timerModel.timestamp.rounded() - elapsed.rounded(), 0)

            self.remainingTime = remaining
        }
    }

    private func pauseTimer() {
        timerState = .paused
        pausedTimeInterval += Date().timeIntervalSince(startTime ?? Date())
        timer?.invalidate()
    }

    func resetTimer() {
        timerState = .set
        timer?.invalidate()
        timer = nil
        remainingTime = timerModel.timestamp
        remainingTime = 0
    }
}
