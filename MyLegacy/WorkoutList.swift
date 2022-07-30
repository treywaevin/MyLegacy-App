//
//  WorkoutList.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/25/22.
//

import SwiftUI

struct WorkoutList: View {
    var workouts: [WorkoutDay]
    
    @Binding var show: Bool
    @Binding var outputWorkout: Int
    var body: some View {
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing:15)], spacing: 15){
                ForEach(Array(workouts.enumerated()), id:\.offset) { index, workout in
                    WorkoutCard(workout: workout)
                        .onTapGesture{
                            print("\(workout.name), \(index)")
                            outputWorkout = index
                            withAnimation(.easeIn){
                                show.toggle()
                            }
                        }
                }
                AddCard()
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList(workouts: WorkoutDay.all, show: .constant(true), outputWorkout: .constant(0))
    }
}
