//
//  WhatToEat_App.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import Firebase
import FirebaseAnalytics
import SwiftUI

@main
struct WhatToEatApp: App {
    @StateObject var rootModelData = GlobalModelData()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(rootModelData)
                .onAppear {
                    setAnalytics()
                    Persistence.loadLocalData { result in
                        switch result {
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        case .success(let data):
                            rootModelData.localData = data
                            setFoodCategory()
                        }
                    }
                }
        }
    }

    private func setAnalytics() {
        FirebaseApp.configure()
    }
}
