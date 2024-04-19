//
//  LandmarkList.swift
//  0706012210011-Lie, Samuel-AFL3
//
//  Created by student on 18/04/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData // to use the Observable
    @State private var showFavoritesOnly = false // initial/starting UI state in Swift, change to manually trigger filtered list
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink { // automatic link from SwiftUI
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks) // Animation is clean, wish Android Studio has this built-in
            
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark") // in iPad view would be the show up as a default if no Landmark is selected
        }
    }
}

#Preview { // Don't forget environment for observable
    LandmarkList()
        .environment(ModelData())
}
