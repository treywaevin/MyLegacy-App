//
//  WorkoutList.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/25/22.
//

import SwiftUI

struct WorkoutList: View {
    var workouts: [WorkoutDay]
    
    var body: some View {
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing:15)], spacing: 15){
                ForEach(workouts){ workout in
                    WorkoutCard(workout: workout)
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
        WorkoutList(workouts: WorkoutDay.all)
    }
}
