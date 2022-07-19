//
//  HomeScreen.swift
//  MyLegacy
//
//  Created by Aevin Eliares on 7/13/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        TabView{
            Text("Home")
                .tabItem {
                    Text("Home")
                }
            Text("Profile")
                .tabItem {
                    Text("Profile")
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
