//
//  TimerItemView.swift
//  Time me
//
//  Created by Yassine Toutouh on 06/08/2025.
//

import SwiftUI

struct TimerItemView: View {
    @State private var timerViewModel = TimerViewModel()
    
    let timerModel: TimerModel
    
    var body: some View {
        HStack(spacing: 8) {
            Text(timerModel.name)
            
            Spacer()
            
            Text(timerModel.timestamp.)
            
            Button {
                // Play timer
            } label: {
                Circle()
                    .frame(height: 34)
                    .overlay {
                        Image(systemName: "play.fill")
                            .foregroundStyle(Color.orange)
                    }
            }
        }
    }
}
