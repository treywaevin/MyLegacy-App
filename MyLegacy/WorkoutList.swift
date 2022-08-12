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
    @State var new_day = "Untitled"
    
    // Data stored in app memory
    @AppStorage("workouts") private var workoutData: Data = Data()
    
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
                    .onTapGesture{
                        addAlertView()
                    }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
    
    func addAlertView(){
        let alert = UIAlertController(title:"Add Day", message: "Enter new workout day", preferredStyle: .alert)
        
        alert.addTextField{field in
            field.placeholder = "Workout Day"
        }
        // Alert buttons
        alert.addAction(UIAlertAction(title:"Cancel",style:.cancel,handler: nil))
        alert.addAction(UIAlertAction(title:"Add",style: .default,handler:{ _ in
            // Set textfield to variable
            new_day = alert.textFields![0].text!
            
            WorkoutDay.all.append(WorkoutDay(name: new_day))
            
            // Store into app memory
            guard let workouts = try?JSONEncoder().encode(WorkoutDay.all) else{return}
            
            workoutData = workouts
            
            outputWorkout = WorkoutDay.all.count - 1
            
            
            withAnimation(.easeIn){
                show.toggle()
            }
        }))
        
        rootController().present(alert,animated:true, completion:nil)
        
        func rootController()->UIViewController{
            guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
                return .init()
            }
            
            guard let root = screen.windows.first?.rootViewController else{
                return .init()
            }
            
            return root
        }
    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList(workouts: WorkoutDay.all, show: .constant(true), outputWorkout: .constant(0))
    }
}
