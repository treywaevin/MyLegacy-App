//
//  ContentView.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/8/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("registerShown") var shown: Bool = false
    var body: some View {
        if(shown){
            FirstTime()
        }
        else{
            HomeScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
