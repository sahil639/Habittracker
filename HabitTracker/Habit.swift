//
//  Habit.swift
//  HabitTracker
//
//  Created by Sahil Pednekar on 28/01/25.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var name: String
    var streak: Int
}
