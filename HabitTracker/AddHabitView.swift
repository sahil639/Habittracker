//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Sahil Pednekar on 28/01/25.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss // Dismiss the sheet
    @ObservedObject var viewModel: HabitViewModel
    @State private var habitName = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Habit Name", text: $habitName)
            }
            .navigationTitle("Add Habit")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !habitName.isEmpty {
                            viewModel.addHabit(name: habitName)
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(viewModel: HabitViewModel())
    }
}
