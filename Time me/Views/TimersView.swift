//
//  TimersView.swift
//  Time me
//
//  Created by Yassine Toutouh on 02/08/2025.
//

import SwiftData
import SwiftUI

struct TimersView: View {
    @Environment(\.modelContext) private var modelContext

    @Query private var timerModels: [TimerModel]

    @State private var isShowingAddTimerView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(timerModels) { item in
                    TimerItemView(timerModel: item)
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isShowingAddTimerView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.orange)
                    })
                }
            }
            .navigationTitle("Mes minuteurs")
            .sheet(isPresented: $isShowingAddTimerView) {
                AddTimerSheetView()
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                deleteTimer(timerModel: timerModels[index])
            }
        }
    }

    private func deleteTimer(timerModel: TimerModel) {
        modelContext.delete(timerModel)

        do {
            try modelContext.save()
        } catch {}
    }
}

#Preview {
    TimersView()
        .modelContainer(for: TimerModel.self, inMemory: true)
}
