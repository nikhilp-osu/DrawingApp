//
//  DrawKitAppApp.swift
//  DrawKitApp
//
//  Created by Palamoni, Nikhil Palamoni on 4/17/25.
//

import SwiftUI

@main
struct DrawKitAppApp: App {
    @StateObject private var canvasVM = CanvasViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(canvasVM)
        }
    }
}
