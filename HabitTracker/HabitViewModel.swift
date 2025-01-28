//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Sahil Pednekar on 28/01/25.
//

import Foundation

class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = []

    private let saveKey = "Habits"

    init() {
        loadHabits()
    }

    func addHabit(name: String) {
        let newHabit = Habit(name: name, streak: 0)
        habits.append(newHabit)
        saveHabits()
    }

    func incrementStreak(habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].streak += 1
            saveHabits()
        }
    }

    private func saveHabits() {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }

    private func loadHabits() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
            habits = decoded
        }
    }
}
