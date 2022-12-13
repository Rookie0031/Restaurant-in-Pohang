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
            .listRowSeparator(.hidden)
            .navigationTitle("먹킷리스트")
        }
        .onChange(of: scenePhase, perform: { phase in
            if phase == .inactive {
                print("The scene becomes inactive")
                Persistence.saveLocalData(data: modelData.localData) { result in
                    if case .failure(let failure) = result {
                        fatalError(failure.localizedDescription)
                    }
                }
            }
        })
    }
}
