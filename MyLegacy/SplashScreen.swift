//
//  WelcomeView.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/8/22.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size=0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive{
            ContentView()
        }
        else{
            VStack{
                VStack{
                    Image("zyzz")
                    Text("MyLegacy")
                        .bold()
                        .font(Font.custom("Baskerville-Bold", size:26))
                    Text("Fitness Tracking App")
                        .foregroundColor(.white)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration:1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
