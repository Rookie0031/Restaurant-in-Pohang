//
//  FavoriteButton.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/03.
//

import SwiftUI

struct FavoriteButton: View {
    let pageId: String
    let data: Properties
    @ObservedObject var vm: FoodListVM
    @State private var isFavorite: Bool = false

    var body: some View {
        Button {
            changeFavoriteState(data: data)
            print(favoriteFoods)
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isFavorite ? .pink : .gray)
        }
        .onAppear {
            isFavorite = favoriteFoods.contains(pageId)
        }
    }

    private func changeFavoriteState(data: Properties) {
        if favoriteFoods.contains(pageId) {
            print("Favorite Data Store")
            guard let index = favoriteFoods.firstIndex(of: pageId) else { return }
            favoriteFoods.remove(at: index)

            print("Favorite Count")
            print(vm.favorites.count)

            guard let propIndex = vm.favorites.firstIndex(of: data) else { return }
            print("Favorite Food Delete")
            vm.favorites.remove(at: propIndex)

        } else {
            favoriteFoods.append(pageId)
            vm.favorites.append(data)
        }

        isFavorite.toggle()

        if let encodedData = try? JSONEncoder().encode(favoriteFoods) {
            UserDefaults.standard.set(encodedData, forKey: "MyFavorites")
            print("Favorite Data Stored")
        }
    }
}
