//
//  Item.swift
//  Time me
//
//  Created by Yassine Toutouh on 02/08/2025.
//

import Foundation
import SwiftData

@Model
final class TimerModel {
    var name: String
    var timestamp: TimeInterval

    init(name: String, timestamp: TimeInterval) {
        self.name = name
        self.timestamp = timestamp
    }
}
