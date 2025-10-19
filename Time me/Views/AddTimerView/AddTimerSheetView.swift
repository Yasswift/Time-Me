//
//  AddTimerSheetView.swift
//  Time me
//
//  Created by Yassine Toutouh on 06/08/2025.
//

import SwiftData
import SwiftUI

struct AddTimerSheetView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var addTimerViewModel = AddTimerViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                HStack {
                    Circle()
                        .fill(.clear)
                        .frame(width: 32)
                        .overlay {
                            Image(systemName: "multiply")
                                .font(.title3)
                                .foregroundStyle(.orange)
                        }
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                }
                VStack {
                    Text("Nouveau Timer")
                        .font(Font.title.bold())

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Nom du minuteur")
                            .bold()
                            .font(.title3)
                        Divider()
                            .frame(width: 100, height: 4)
                            .background(Color.orange)
                            .padding(.bottom, 8)
                        TextField("Ex: Cuisson œuf mollet, riz pilaf...",
                                  text: $addTimerViewModel.timerName)
                    }
                    .padding(.top, 16)

                    TimePickerView(addTimerViewModel: addTimerViewModel)

                    Spacer()

                    Button {
                        addTimerViewModel.saveNewTimer {
                            dismiss()
                        }
                    } label: {
                        Rectangle()
                            .fill(addTimerViewModel.isTimerValid
                                ? Color.orange.opacity(0.8)
                                : Color.gray.opacity(0.1))
                            .cornerRadius(12)
                            .frame(height: 44)
                            .overlay {
                                Text("Enregistrer")
                            }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(16)
        }
        .onAppear {
            addTimerViewModel.modelContext = modelContext
        }
    }
}

#Preview {
    AddTimerSheetView()
        .modelContainer(for: TimerModel.self, inMemory: true)
}
