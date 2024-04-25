//
//  _706012210011_Lie__Samuel_AFL3App.swift
//  0706012210011-Lie, Samuel-AFL3
//
//  Created by student on 18/04/24.
//

import SwiftUI

@main
struct _706012210011_Lie__Samuel_AFL3App: App {
    @State private var modelData = ModelData()
    
    // Mohon pakai Emulator karena previewnya buggy
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
