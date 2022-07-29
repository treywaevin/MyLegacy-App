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
    var body: some View {
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing:15)], spacing: 15){
                ForEach(workouts){ workout in
                    WorkoutCard(workout: workout)
                        .onTapGesture{
                            print("\(workout.name)")
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
        WorkoutList(workouts: WorkoutDay.all, show: .constant(true))
    }
}
