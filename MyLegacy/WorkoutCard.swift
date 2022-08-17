//
//  WorkoutCard.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/24/22.
//

import SwiftUI

let test_workout = WorkoutDay(name: "Push")

struct WorkoutCard: View {
    var index: Int
    var workout: WorkoutDay
    
    // Load Current Index
    @AppStorage("current") var current = 0
    @State private var highlight = 0
    var body: some View {
        // Custom colors
        let russianGreen = Color(red: 107/255, green: 143/55, blue:113/255)
        let magicMint = Color(red: 185/255, green: 245/255, blue:216/255)
        // Create workout card
        VStack{
            Spacer()
                .frame(height:20)
            Text("\(workout.name)")
                .font(.system(size: 40, weight: .bold, design:.rounded))
                .foregroundColor(.white)
            Spacer()
                .frame(height: 40)
            //Text("\(workout.exercises.count) exercises")
           // Spacer()
                .frame(height: 5)
            HStack{
                Spacer()
                    .frame(width:120)
                Image(systemName: "chevron.right.circle")
                    .foregroundColor(.black)
            }
        }
        .frame(width: 160, height: 160, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [russianGreen, magicMint]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x:0, y:10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.red,lineWidth: CGFloat(highlight)))
        .onAppear{
            if current == index{
                highlight = 4
            }
            else{
                highlight = 0
            }
        }
    }
}

struct AddCard: View{
    var body: some View{
        VStack{
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
        }
        .frame(width: 160, height:160, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius:20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x:0, y:10)
    }
}

struct WorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCard(index: 0, workout: test_workout)
        //AddCard()
    }
}
