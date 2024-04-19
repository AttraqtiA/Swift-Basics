//
//  ContentView.swift
//  0706012210011-Lie, Samuel-AFL3
//
//  Created by student on 18/04/24.
//

import SwiftUI

struct ContentView: View { // Main Display / Root View, like Route.kt (?)
    @State private var selection: Tab = .featured
    
    enum Tab { // BottomNavigation
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}
#Preview {
    ContentView()
        .environment(ModelData())
}
