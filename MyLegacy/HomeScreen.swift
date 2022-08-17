//
//  HomeScreen.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/13/22.
//

import SwiftUI

struct Home: View{
    /* TO DO
     Goals:
        - Be able to make any workout current workout and be able to cycle by the next day
        - Make sure data is saved when logging workouts*/
    @AppStorage("name") var name = "User"
    @AppStorage("current") var current = 0
    @State var dateString = ""
    @State var show = false
    @State var showExercise = WorkoutDay.all[0].exercises[0]
    
    //Loaad Data
    @AppStorage("workouts") private var workoutsData: Data = Data()
    @State var allWorkouts: [WorkoutDay] = WorkoutDay.all
    
    var body: some View{
        NavigationView{
            ZStack{
                Color(red: 217/255, green: 255/255, blue: 245/255)
                    .ignoresSafeArea()
                VStack(spacing: 40){
                    // Current Workout Day
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 29/255, green: 30/255, blue: 24/255))
                            .frame(width: 350, height: 150)
                        VStack(alignment: .leading){
                            Text("\(dateString)")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold, design:.rounded))
                            Text("Today you are hitting \(WorkoutDay.all[current].name)")
                                .foregroundColor(.white)
                        }
                    }
                    ZStack{
                        Color.white
                        VStack{
                            List{
                                ForEach(allWorkouts[current].exercises){ exercise in
                                    LogRow(exercise: exercise)
                                        .onTapGesture{
                                            showExercise = exercise
                                            withAnimation(.easeIn){
                                                show.toggle()
                                            }
                                        }
                                }
                            }
                            .listStyle(.plain)
                            //.frame(height:330)
                            
                            Button(action:{
                                logWorkout()
                            },label:{
                                Text("Log Workout")
                            })
                        }
                    }
                }
                    .navigationTitle("Hi \(name)!")
                if show{
                    Color.black.opacity(0.3).ignoresSafeArea()
                    LogVIew(exercise: showExercise, show: $show)
                        .transition(.move(edge: .bottom))
                }
            }
        }
        .onAppear{
            dateString = Date.now.formatted(.dateTime.weekday(.wide).month(.wide).day())
            
            // Load App memory idata
            guard let workouts = try?JSONDecoder().decode([WorkoutDay].self, from: workoutsData) else {return}
            allWorkouts = workouts
            WorkoutDay.all = workouts
        }
    }
    
    // Saves workout, checking if any personal records were made
    func logWorkout(){
        // Loop through exercises
        for exercise in allWorkouts[current].exercises{
            // Go through each exerises weight
            for i in 0..<exercise.weight.count{
                // If heavy weight was found
                
                if(exercise.weight[i] > exercise.pr){
                    exercise.pr = exercise.weight[i]
                    exercise.pr_reps = exercise.reps[i]
                }
                // If WEight is the same as pr weight
                else if(exercise.weight[i] == exercise.pr){
                    
                    // If more reps are done, log it as pr reps
                    
                    if exercise.reps[i] > exercise.pr_reps{
                        exercise.pr_reps = exercise.reps[i]
                    }
                }
            }
        }
        
        // Once done looping through all exercises, save data to app storage
        
        guard let workouts = try?JSONEncoder().encode(WorkoutDay.all) else{return}
        workoutsData = workouts
    }
}

struct Workouts: View{
    @State var show = false
    @State var workoutIndex: Int = 0
    @State var allWorkouts: [WorkoutDay] = WorkoutDay.all
    
    // Data stored in apps
    @AppStorage("workouts") private var workoutsData: Data = Data()
    
    var body: some View{
        NavigationView{
            ZStack{
                Color(red: 217/255, green: 255/255, blue: 245/255)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text("Workout").font(.largeTitle).bold()
                    }
                        ScrollView{
                            WorkoutList(workouts: allWorkouts, show: $show, outputWorkout: $workoutIndex)
                        }
                }
                .frame(maxWidth:.infinity, maxHeight:.infinity, alignment:.topLeading)
                if show{
                    Color.black.opacity(0.3).ignoresSafeArea()
                    WorkoutView(workoutday: WorkoutDay.all[workoutIndex], show: $show)
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                        .navigationTitle("")
                        .onDisappear(){
                            // Update List
                            guard let workouts = try?JSONDecoder().decode([WorkoutDay].self, from: workoutsData) else {return}
                            allWorkouts = workouts
                            WorkoutDay.all = workouts
                            print("Workouts: \(WorkoutDay.all)")

                        }
                    
                }
            }
        }
        .onAppear(){
            // Load Data stored from app memory into variable
            print("Loading Workout List")
            guard let workouts = try?JSONDecoder().decode([WorkoutDay].self, from: workoutsData) else {return}
            allWorkouts = workouts
            WorkoutDay.all = workouts
            print("Workouts: \(WorkoutDay.all)")

        }
    }
    
    
}

struct HomeScreen: View {
    // Data stored in apps
    @AppStorage("workouts") private var workoutsData: Data = Data()
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Workouts()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Workouts")
                }
            Text("WIP - Coming Soon")
                .tabItem {
                    Image(systemName: "heart.text.square")
                    Text("Progress")
                }
        }
        .onAppear(){
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

