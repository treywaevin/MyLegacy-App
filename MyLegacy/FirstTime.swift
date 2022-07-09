//
//  FirstTime.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/8/22.
//

import SwiftUI

struct FirstTime: View {
    var body: some View {
        ZStack{
            Color.cyan
                .ignoresSafeArea()
            VStack{
                Text("Hi.")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 60))
                Text("Welcome to your personal gym tracker")
                    .foregroundColor(.white)
                
                ZStack{
                    Circle()
                        .scale(1.7)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(0.8)
                        .foregroundColor(.white)
                    Image("crucifix")
                    
                }
                ZStack{
                    Capsule()
                        .foregroundColor(.cyan)
                    Capsule()
                        .foregroundColor(.white.opacity(0.3))
                    Button(action: start){
                        Text("Let's get started")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                }
                .frame(height: 80)
                .offset(y:-40)
            }
            
        }
    }
}

struct FirstTime_Previews: PreviewProvider {
    static var previews: some View {
        FirstTime()
    }
}

func start(){
    print("Hello World")
}
