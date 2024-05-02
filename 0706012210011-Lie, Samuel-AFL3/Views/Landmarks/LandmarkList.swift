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
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        @Bindable var modelData = modelData

        NavigationSplitView {
            List(selection: $selectedLandmark) {
//                Toggle(isOn: $showFavoritesOnly) {
//                    Text("Favorites only")
//                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink { // automatic link from SwiftUI
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .animation(.default, value: filteredLandmarks) // Animation is clean, wish Android Studio has this built-in
            
            .navigationTitle(title)
            
            // Mac
            .frame(minWidth: 300)
            
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark") // in iPad view would be the show up as a default if no Landmark is selected
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview { // Don't forget environment for observable
    LandmarkList()
        .environment(ModelData())
}
