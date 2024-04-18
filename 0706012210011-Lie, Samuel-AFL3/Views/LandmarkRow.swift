//
//  LandmarkRow.swift
//  0706012210011-Lie, Samuel-AFL3
//
//  Created by student on 18/04/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()

                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

// Multiple Preview in one
#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

