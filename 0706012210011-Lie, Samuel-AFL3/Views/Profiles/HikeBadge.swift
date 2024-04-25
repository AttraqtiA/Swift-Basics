//
//  HikeBadge.swift
//  0706012210011-Lie, Samuel-AFL3
//
//  Created by student on 19/04/24.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
        // Add an accessibility label whenever doing so would make the meaning of a user interface element clearer to more users.
        
        // Always test your app with VoiceOver on, and then add accessibility labels to your app’s views as necessary.
    }
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
