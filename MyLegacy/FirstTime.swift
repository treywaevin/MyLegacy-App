//
//  FirstTime.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/8/22.
//

import SwiftUI

struct FirstTime: View {
    @State private var showRegister = false
    var body: some View {
        NavigationView{
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
                    NavigationLink(destination: RegisterScreen()){
                        ZStack{
                            Capsule()
                                .foregroundColor(.cyan)
                            Capsule()
                                .foregroundColor(.white.opacity(0.3))
                            Text("Let's Begin")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .font(.system(size:20))
                        }
                    }
                    .frame(height: 80)
                    .offset(y:-40)
                    
                    Spacer()
                }
                
            }
        }
    }
}


struct FirstTime_Previews: PreviewProvider {
    static var previews: some View {
        FirstTime()
        //RegisterView()
    }
}

func start(){
    print("Hello World")
}
