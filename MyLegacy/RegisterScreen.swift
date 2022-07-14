//
//  RegisterScreen.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/11/22.
//

import SwiftUI

struct RegisterScreen: View{
    @AppStorage("registerShown") var shown = false
    @AppStorage("name") var name = ""
    @AppStorage("weight") var user_weight = ""
    @State private var name_inputted = 0
    @State private var weight_inputted = 0
    @AppStorage("measureIndex") var measureIndex = 0

    var measure = ["Imperial (lbs)", "Metric (kgs)"]

    var body: some View{
        if(shown){
            ContentView()
        }
        ZStack{
            Color.cyan
                .ignoresSafeArea()
            VStack{
                Text("Let's get to know you first")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                // Background colors
                ZStack{
                    Circle()
                        .scale(1.7)
                        .foregroundColor(.white.opacity(0.15))
                    VStack(spacing:50){
                        Text("What should we call you?")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .bold()
                        TextField("Name", text: $name)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
                            .border(.red,width: CGFloat(name_inputted))
                        Text("Current weight:")
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                        
                        // User Weight
                        TextField("Weight", text: $user_weight)
                            .padding()
                            .frame(width: 300, height: 50)
                            .keyboardType(.decimalPad)
                            .background(.white)
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(weight_inputted))
                        HStack{
                            Text("Unit Type:")
                                .foregroundColor(.white)
                                .bold()
                            Picker(selection: $measureIndex, label:
                                    Text("Unit")){
                                ForEach(0 ..< 2){
                                    Text(self.measure[$0]).tag($0)
                                }
                            }
                                .background(.white)
                                .cornerRadius(10)
                            
                        }
                        ZStack{
                            Capsule()
                                .frame(height: 80)
                                .foregroundColor(.white.opacity(0.3))
                            /*T("Start my legacy")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .font(.system(size: 20))*/
                            Button("Test"){
                                if(name == ""){
                                    name_inputted = 2
                                }
                                if(user_weight==""){
                                    weight_inputted = 2
                                }
                                if(name != "" && user_weight != ""){
                                    shown = true
                                    print("Test")
                                    //ContentView()
                                }
                            }
                        }
                            .offset(y:25)
                    }
                }
            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
