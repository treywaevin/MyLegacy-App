//
//  LogVIew.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 8/3/22.
//

import SwiftUI

struct LogVIew: View {
    var exercise: Exercise
    @Binding var show: Bool
    var body: some View {
            
            VStack{
                ScrollView{
                    LogSheet(exercise: exercise, show: $show)
                }
            }
            .frame(maxWidth: 350, maxHeight: 350, alignment: .center)
            .background(Color.white)
            .mask(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black,lineWidth: 4))
    }
}


struct LogSheet: View{
    var exercise: Exercise
    @State private var reps = ""
    @State private var weight = ""
    @Binding var show: Bool
    
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
                    .onTapGesture{
                        withAnimation(.easeIn){
                            show.toggle()
                        }
                    }
            }
            .padding(20)
            VStack{
                ForEach(0..<exercise.sets, id: \.self){ i in
                    SetRow(setNum: i, exercise: exercise)
                }
            }
        }
    }
}

struct SetRow: View{
    var setNum: Int
    var exercise: Exercise
    
    @AppStorage("measureIndex") var measureIndex = 0
    var measure = ["lbs", "kgs"]
    
    @State var reps = ""
    @State var weight = ""
    var body: some View{
        HStack{
            Text("Set \(setNum+1)")
            Spacer()
            TextField("Reps", text: $reps)
                .keyboardType(.numberPad)
                .onSubmit{
                    exercise.reps[setNum] = Int(reps) ?? 0
                }
                .frame(width: 40)
                .border(.primary)
                Text("x")
            TextField("\(measure[measureIndex])", text: $weight)
                .keyboardType(.numberPad)
                .onSubmit {
                    exercise.weight[setNum] = Int(weight) ?? 0
                }
                .frame(width: 35)
                .border(.primary)
            
        }
        .padding()
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
            //Button{} label:{
                Image(systemName: "chevron.right")
            //}
        }
        .padding()
    }
}

struct LogVIew_Previews: PreviewProvider {
    static var previews: some View {
        //LogRow(exercise: Exercise(name:"Push Ups"))
        LogVIew(exercise: WorkoutDay.all[0].exercises[0], show: .constant(true))
        //LogSheet(exercise: WorkoutDay.all[0].exercises[0])
        //SetRow(setNum: 0, exercise: WorkoutDay.all[0].exercises[0])
        
    }
}
