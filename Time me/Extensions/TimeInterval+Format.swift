//
//  File.swift
//  Time me
//
//  Created by Yassine Toutouh on 07/08/2025.
//

import SwiftUI

extension TimeInterval {
    func formatTimeInterval() -> String {
        let hours = Int(self) / 3600
        let minutes = (Int(self) % 3600) / 60
        let seconds = Int(self) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    var asReadableString: String {
        let totalSeconds = Int(self)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60

        var components: [String] = []

        if hours > 0 {
            components.append("\(hours) h")
        }
        if minutes > 0 {
            components.append("\(minutes) min")
        }
        if seconds > 0 || components.isEmpty {
            components.append("\(seconds) s")
        }

        return components.joined(separator: " ")
    }
}
