//
//  FavoriteButton.swift
//  0706012210011-Lie, Samuel-AFL3
//
//  Created by student on 19/04/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool // A binding controls the storage for a value, so you can PASS data around to different views that need to read or write it.
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray) 
            // short if condition as usual
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
