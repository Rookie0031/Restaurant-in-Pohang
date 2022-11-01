//
//  WhatToEat_App.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

@main
struct WhatToEatApp: App {
    @StateObject var rootModelData = RestaurantListViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(rootModelData)
                .onAppear {
                    RestaurantListViewModel.loadLocalData { result in
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
}
