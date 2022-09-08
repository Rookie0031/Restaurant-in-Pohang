//
//  WhatToEat_App.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

@main
struct WhatToEat_App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .task {
                    await modelData.getFromNotionDB()
                }
        }
    }
}
