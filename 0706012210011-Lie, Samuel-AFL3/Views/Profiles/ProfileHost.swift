//
//  ProfileHost.swift
//  0706012210011-Lie, Samuel-AFL3
//
//  Created by student on 19/04/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode // enable edit
    @Environment(ModelData.self) var modelData // database / json reader
    
    @State private var draftProfile = Profile.default
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton() // built-in
            }
            
            if editMode?.wrappedValue == .inactive { // profile display read
                ProfileSummary(profile: modelData.profile)
            } else { // edit mode active
                Text("Profile Editor")
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
