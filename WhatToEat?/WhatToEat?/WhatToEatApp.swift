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
                .onAppear {
                    ModelData.loadLocalData { result in
                        switch result {
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        case .success(let data):
                            rootModelData.localData = data
                            print("==========저장된 로컬 데이터를 불러왔어요!==========")
                            print(rootModelData.localData.count)
                            print("============================")
                        }
                    }
                }
        }
    }
}
