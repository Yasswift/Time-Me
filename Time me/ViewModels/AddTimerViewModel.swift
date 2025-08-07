//
//  AddTimerViewModel.swift
//  Time me
//
//  Created by Yassine Toutouh on 06/08/2025.
//

import SwiftUI

@Observable
class AddTimerViewModel {
    var timerName: String = ""
    var timeSelected: TimeInterval = .zero
    
    var selectedHoursAmount = 0
    var selectedMinutesAmount = 0
    var selectedSecondsAmount = 0
    
    @ private var modelContext: ModelContext

    func saveNewTimer() {
        
    }
}
