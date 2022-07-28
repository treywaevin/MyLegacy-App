//
//  WorkoutView.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/26/22.
//

import SwiftUI

struct WorkoutView: View {
    
    var body: some View {
        let magicMint = Color(red: 185/255, green: 245/255, blue:216/255)
        let russianGreen = Color(red: 107/255, green: 143/55, blue:113/255)
        
        VStack{
            WorkoutBottomSheet(workout: WorkoutDay.all[0])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [russianGreen, magicMint]), startPoint: .top, endPoint: .bottom))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct WorkoutBottomSheet: View{
    var workout: WorkoutDay
    var body: some View{
        VStack{
            // Swipe Bar
            RoundedRectangle(cornerRadius: 3, style: .continuous)
                .frame(width:40, height:5)
                .padding(8)
            // Show workout day and add button
            HStack(spacing: 16){
                Text("\(workout.name)").font(.largeTitle).bold()
                Button {} label: {
                    Label("Add", systemImage: "plus.circle.fill")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .padding(8)
                        .padding(.horizontal, 8)
                }
                .background(Color(hex: 0x6B8F71))
                .cornerRadius(30)
                Spacer()
            }
            .padding(.horizontal, 20)
            // List number of exercises
            HStack{
                Text("\(workout.count) exercises listed")
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 60)
            LazyVStack{
                ForEach(workout.exercises){ exercise in
                    ListRow(exercise: exercise)
                }
            }
            .frame(maxWidth:.infinity, maxHeight:.infinity, alignment:.topLeading)
            Button {} label: {
                Label("Save Workout", systemImage: "pencil")
                    .font(.body.bold())
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(8)
            }
            .background(Color(hex: 0x6B8F71))
            .cornerRadius(30)
        }
    }
    
}

struct ListRow: View{
    var exercise: Exercise
    
    @AppStorage("measureIndex") var measureIndex = 0
    @State private var sets = 1
    var measure = ["lbs","kg"]
    
    var body: some View{
        ZStack{
            Color.white
            VStack{
                HStack{
                    Text("\(exercise.name)").fontWeight(.bold).font(.system(size:23))
                    Text("Personal Record: \(exercise.pr) \(measure[measureIndex]) x \(exercise.pr_reps) reps").font(.system(size: 10))
                    Spacer()
                    
                }
                .padding(.horizontal, 20)
                HStack{
                    Text("\(sets) sets").font(.system(size: 15, weight: .bold))
                    Stepper("", value: $sets, in: 1...10, step: 1)
                    Button {} label: {
                        Label("", systemImage: "trash")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .padding(.horizontal, 8)
                    }
                    .background(.red)
                    .cornerRadius(30)
                }
                .padding(.horizontal, 20)
            }
            .onAppear{
                sets = exercise.sets
            }
        }
        .cornerRadius(30)
    }
}

var test = Exercise(name: "Dumbell Press", sets: 3)
struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
             .background(Color(red: 217/255, green: 255/255, blue: 245/255))
        //WorkoutBottomSheet(workout: WorkoutDay.all[0])
        //ListRow(exercise: test)
    }
}
