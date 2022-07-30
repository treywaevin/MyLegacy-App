//
//  WorkoutModel.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/24/22.
//

import Foundation
import SwiftUI

struct Exercise: Identifiable{
    let id = UUID()
    
    var name: String
    var pr: Int = 0
    var pr_reps: Int = 0
    var sets: Int = 1
    
    var reps: [Int] = []
    var weight: [Int] = []
}

class WorkoutDay: Identifiable{
    let id = UUID()
    var name: String
    var exercises: [Exercise] = []
    init(name: String, exercises: [Exercise] = []){
        self.name = name
        self.exercises = exercises
    }
    
    func deleteExercise(index: IndexSet){
        self.exercises.remove(atOffsets: index)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension WorkoutDay{
    // Filled in for testing purposes
    static var all: [WorkoutDay] = [
        WorkoutDay(name: "Push", exercises: [Exercise(name: "Dumbell Press", sets:3)
                                             ,Exercise(name: "Incline Press", sets: 3)
                                             ,Exercise(name:"Lateral Raise", sets:3)
                                             ,Exercise(name:"Dips",sets:3)
                                            ,Exercise(name: "Dumbell Press", sets:3)
                                             ,Exercise(name: "Incline Press", sets: 3)
                                             ,Exercise(name:"Lateral Raise", sets:3)
                                             ,Exercise(name:"Dips",sets:3)
                                              ]),
        WorkoutDay(name: "Pull"),
        WorkoutDay(name: "Legs")
    ]
}
