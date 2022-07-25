//
//  WorkoutModel.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/24/22.
//

import Foundation

struct Exercise{
    var name: String
    var pr: Int
    var sets: Int
    
    var reps: [Int] = []
    var weight: [Int] = []
}

struct WorkoutDay: Identifiable{
    let id = UUID()
    var name: String
    var count: Int = 0
    var exercises: [Exercise] = []
}

