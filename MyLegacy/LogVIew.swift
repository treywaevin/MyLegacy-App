//
//  LogVIew.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 8/3/22.
//

import SwiftUI

struct LogVIew: View {
    var exercise: Exercise
    
    var body: some View {
            VStack{
                Text("Hi")
            }
            .frame(maxWidth: 350, maxHeight: 350, alignment: .center)
            .mask(RoundedRectangle(cornerRadius: 10))
    }
}


struct LogSheet: View{
    var exercise: Exercise
    
    @State private var reps = ""
    @State private var weight = ""
    
    @AppStorage("measureIndex") var measureIndex = 0
    var measure = ["lbs", "kgs"]
    
    var body: some View{
        VStack{
            HStack{
                VStack(alignment:.leading){
                    Text("\(exercise.name)")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("\(exercise.sets) set(s)")
                }
                Spacer()
                Image(systemName: "x.circle")
            }
            .padding(20)
            VStack{
                ForEach(0..<exercise.sets, id: \.self){ i in
                    HStack{
                        Text("Set \(i+1)")
                        Spacer()
                        TextField("Reps", text: $reps)
                            .keyboardType(.numberPad)
                            .onSubmit{
                                exercise.reps[i] = Int(reps) ?? 0
                            }
                            .frame(width: 40)
                            .border(.primary)
                            Text("x")
                        TextField("\(measure[measureIndex])", text: $weight)
                            .keyboardType(.numberPad)
                            .onSubmit {
                                exercise.weight[i] = Int(weight) ?? 0
                            }
                            .frame(width: 35)
                            .border(.primary)
                        
                    }
                    .padding()
                }
            }
        }
    }
}

struct LogRow: View{
    var exercise: Exercise
    
    var body: some View{
        HStack{
            Text("\(exercise.name)")
                .fontWeight(.heavy)
            Text("\(exercise.sets) set(s)")
            Spacer()
            Button{} label:{
                Image(systemName: "chevron.right")
            }
        }
        .padding()
    }
}

struct LogVIew_Previews: PreviewProvider {
    static var previews: some View {
        //LogRow(exercise: Exercise(name:"Push Ups"))
        //LogVIew(exercise: WorkoutDay.all[0].exercises[0])
        LogSheet(exercise: WorkoutDay.all[0].exercises[0])
        
    }
}
