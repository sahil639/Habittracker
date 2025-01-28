//
//  ContentView.swift
//  HabitTracker
//
//  Created by Sahil Pednekar on 28/01/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject var viewModel = HabitViewModel() // Instance of the ViewModel
    @State private var showingAddHabit = false // State for showing the Add Habit sheet

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.habits.isEmpty {
                    Text("No habits added yet!")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.habits) { habit in
                            HStack {
                                Text(habit.name)
                                    .font(.body)
                                Spacer()
                                Text("Streak: \(habit.streak)")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                Button(action: {
                                    viewModel.incrementStreak(habit: habit)
                                    let generator = UIImpactFeedbackGenerator(style: .medium)
                                    generator.impactOccurred() // Haptic feedback
                                }) {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddHabit = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
