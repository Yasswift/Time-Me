//
//  AddTimerViewModel.swift
//  Time me
//
//  Created by Yassine Toutouh on 06/08/2025.
//

import SwiftData
import SwiftUI

@Observable
class AddTimerViewModel {
    var timerName: String = ""
    var timeSelected: TimeInterval = .zero

    var selectedHoursAmount = 0
    var selectedMinutesAmount = 0
    var selectedSecondsAmount = 0

    var isTimerValid: Bool {
        selectedHoursAmount > 0 || selectedMinutesAmount > 0 || selectedSecondsAmount > 0
    }

    @ObservationIgnored
    var modelContext: ModelContext? = nil

    @MainActor
    func saveNewTimer() {
        guard let modelContext else { return }

        timeSelected = TimeInterval(selectedHoursAmount * 3600) + TimeInterval(selectedMinutesAmount * 60) + TimeInterval(selectedSecondsAmount)

        modelContext.insert(TimerModel(name: timerName.isEmpty ? timeSelected.asReadableString : timerName, timestamp: timeSelected))

        do {
            try modelContext.save()
        } catch {}
    }
}
