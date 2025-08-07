//
//  AddTimerSheetView.swift
//  Time me
//
//  Created by Yassine Toutouh on 06/08/2025.
//

import SwiftUI

struct AddTimerSheetView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var addTimerViewModel = AddTimerViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                HStack {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 32)
                        .overlay {
                            Image(systemName: "multiply")
                        }
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                }
                VStack {
                    Text(addTimerViewModel.timerName.isEmpty ? "Nouveau" : addTimerViewModel.timerName)
                        .font(Font.title.bold())

                    TimePickerView(addTimerViewModel: addTimerViewModel)
                    Form {
                        Section("Nom du Timer") {
                            TextField("Ex: Cuisson œuf mollet", text: $addTimerViewModel.timerName)
                        }
                    }
                    Spacer()
                    Button {
                        if !addTimerViewModel.timerName.isEmpty {
                            modelContext.insert(TimerModel(name: addTimerViewModel.timerName, timestamp: addTimerViewModel.timeSelected))
                        }
                    } label: {
                        Rectangle()
                            .fill(timerName.isEmpty ? Color.gray.opacity(0.8) : Color.orange.opacity(0.8))
                            .cornerRadius(12)
                            .frame(height: 44)
                            .overlay {
                                Text("Enregistrer")
                                    .foregroundStyle(.black)
                            }
                    }
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    AddTimerSheetView()
        .modelContainer(for: TimerModel.self, inMemory: true)
}
