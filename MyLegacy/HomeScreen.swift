//
//  HomeScreen.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/13/22.
//

import SwiftUI

struct Home: View{
    @AppStorage("name") var name = "Aevin"
    @AppStorage("current") var current = "Rest"
    @State var dateString = ""
    
    var body: some View{
        NavigationView{
            ZStack{
                Color(red: 217/255, green: 255/255, blue: 245/255)
                    .ignoresSafeArea()
                VStack(spacing: 60){
                    // Current Workout Day
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 29/255, green: 30/255, blue: 24/255))
                            .frame(width: 350, height: 150)
                        VStack(alignment: .leading){
                            Text("\(dateString)")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold, design:.rounded))
                            Text("Today is \(current)")
                                .foregroundColor(.white)
                        }
                    }
                    
                    // Exercise List
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                        LazyVStack{
                            Text("Test")
                            Text("Test")
                        }
                    }
                }
                    .navigationTitle("Hi \(name)!")
            }
        }
        .onAppear{
            dateString = Date.now.formatted(.dateTime.weekday(.wide).month(.wide).day())
        }
    }
}

struct Workouts: View{
    @State var show = false
    @State var workoutIndex: Int = 0
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
                            WorkoutList(workouts: WorkoutDay.all, show: $show, outputWorkout: $workoutIndex)
                        }
                }
                .frame(maxWidth:.infinity, maxHeight:.infinity, alignment:.topLeading)
                if show{
                    Color.black.opacity(0.3).ignoresSafeArea()
                    WorkoutView(workoutday: WorkoutDay.all[workoutIndex], show: $show)
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                        .navigationTitle("")
                }
            }
        }
    }
}

struct HomeScreen: View {
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
            Text("Progress")
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

