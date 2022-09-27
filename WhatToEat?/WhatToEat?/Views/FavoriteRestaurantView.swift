//
//  BucketListView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/02.
//

import SwiftUI

struct FavoriteRestaurantView: View {

    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject var modelData: ModelData
    private var favoriteRestaurants: [Properties] {
        modelData.localData.filter({$0.favorite.checkbox == true})
        }
    
    var body: some View {
        NavigationView {
            List(favoriteRestaurants, id: \.id.number) {restaurant in
                NavigationLink{
                    RestaurantInfoView(foodInformation: restaurant)
                } label: {
                    RestaurantInfoRow(restaurant: restaurant)
                }
            }
            .navigationTitle("먹킷리스트를 관리해봐요!")
        }
        .onChange(of: modelData.localData, perform: { newValue in
            let savedData = newValue
            print("저장전 데이터 점검")
            print(savedData.filter({$0.favorite.checkbox == true}).count)
            ModelData.saveLocalData(data: savedData) { result in
                if case .failure(let failure) = result {
                    fatalError(failure.localizedDescription)
                }
            }
            print("바뀐 정보가 저장되었습니다")
            print(modelData.localData.filter({$0.favorite.checkbox == true}).count)
        })
    }
}
