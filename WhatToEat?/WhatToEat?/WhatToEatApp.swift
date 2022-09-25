//
//  WhatToEat_App.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

@main
struct WhatToEatApp: App {
    @StateObject private var rootModelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(rootModelData)
                .task {
                    await rootModelData.getFromNotionDB()
                }
                .onAppear {
                    ModelData.loadFavoritesRestaurants { result in
                        switch result {
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        case .success(let data):
                            rootModelData.favoriteRestaurants = data
                        }
                    }
                }
        }
    }
}
