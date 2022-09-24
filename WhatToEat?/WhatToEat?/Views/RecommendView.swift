//
//  MainPageView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//
// category 전부 enum으로 빼기
// State var filtered data 이름 바꾸고, final class안으로 갖다넣기
// current index는 state data로 바꿔서 final class안으로 넣기
//

import SwiftUI

struct RecommendView: View {

    @ObservedObject var modelData : ModelData
    @State private var filteredGroupA : [Properties] = []
    @State private var filteredGroupB : [Properties] = []
    @State private var filteredGroupC : [Properties] = []
    @State private var filteredGroupD : [Properties] = []
    @State private var filteredGroupFinal : [Properties] = []
    
    @State private var currentIndex1 : Int = 0
    @State private var currentIndex2 : Int = 0
    @State private var currentIndex3 : Int = 0
    @State private var currentIndex4 : Int = 0

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 30) {
                foodTypeQuestion()
                numberOfPeopleQuestion()
                priceRangeQuestion()
                locationPreferenceQuestion()
                Spacer()
                getRecommendationButton()
            }
            .padding(20)
            .navigationTitle("맛집을 추천드릴게요!")
        }
    }

    private func foodTypeQuestion() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("어떤 종류가 먹고 싶나요?")
                .customInfoTitle()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(foodCategory, id: \.self) { category in
                        Button(action: {
                            currentIndex1 = foodCategory.firstIndex(of: category)!
                            filteredGroupA = modelData.foodData.filter { $0.category.select.name == category }
                        }) {
                            Text(category)
                                .customCategory()
                                .foregroundColor( foodCategory.firstIndex(of: category)! == currentIndex1 ? .white : .black )
                                .background(RoundedRectangle(cornerRadius: 10).fill( foodCategory.firstIndex(of: category)! == currentIndex1 ? Color.lightOrange : .white))
                        }
                        .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 8)))
                    }
                }
            }
            Divider()
        }
    }

    private func numberOfPeopleQuestion() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("몇명이서 먹을건가요?")
                .customInfoTitle()

            HStack {
                ForEach(peopleCategory, id: \.self) { value in
                    Button(action: {
                        currentIndex2 = peopleCategory.firstIndex(of: value)!
                        for foodData in modelData.foodData {
                            var joinedString = ""
                            for detailedData in foodData.people.multiSelect {
                                joinedString += detailedData.name
                            }
                            if joinedString.contains(value) {
                                filteredGroupB.append(foodData)
                            }
                        }
                    }) {
                        Text(value)
                            .customCategory()
                            .foregroundColor(peopleCategory.firstIndex(of: value)! == currentIndex2 ? .white : .black)
                            .background(RoundedRectangle(cornerRadius: 10).fill(peopleCategory.firstIndex(of: value)! == currentIndex2 ? .orange : .white))
                    }
                    .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 5)))
                }
            }
            Divider()
        }
    }

    private func priceRangeQuestion() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("원하는 가격대가 있나요?")
                .customInfoTitle()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(priceCategory, id: \.self) { value in
                        Button(action: {
                            currentIndex3 = priceCategory.firstIndex(of: value)!
                            filteredGroupC = modelData.foodData.filter { restaurant in
                                restaurant.price.select.name == value }
                        }) {
                            Text(value)
                                .customCategory()
                                .foregroundColor(priceCategory.firstIndex(of: value)! == currentIndex3 ? .white : .black)
                                .background(RoundedRectangle(cornerRadius: 10).fill(priceCategory.firstIndex(of: value)! == currentIndex3 ? .orange : .white))
                        }
                        .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 0)))
                    }
                }
            }

            Divider()
        }
    }

    private func locationPreferenceQuestion() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("선호하는 위치가 있나요?")
                .customInfoTitle()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(locationCategory, id: \.self) { value in
                        Button(action: {
                            currentIndex4 = locationCategory.firstIndex(of: value)!
                            filteredGroupD = modelData.foodData.filter { restaurant in
                                restaurant.location.richText.first!.text.content == value }
                        }) {
                            Text(value)
                                .customCategory()
                                .foregroundColor(locationCategory.firstIndex(of: value)! == currentIndex4 ? .white : .black)
                                .background(RoundedRectangle(cornerRadius: 10).fill(locationCategory.firstIndex(of: value)! == currentIndex4 ? .orange : .white))
                        }
                        .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 0)))
                    }
                }
            }
            Divider()
        }
    }

    private func getRecommendationButton() -> some View {
        VStack {
            if !modelData.foodData.isEmpty {
                NavigationLink(destination: FoodInfoView(foodInformation: filteredGroupFinal.randomElement() ?? modelData.foodData.first!)) {
                    Button {
                        filteredGroupFinal = self.filteredGroupA.filter{filteredGroupB.contains($0)}.filter{filteredGroupC.contains($0)}.filter{filteredGroupD.contains($0)}
                    } label: {
                        Text("맛집 추천받기!")
                            .customButtonFormat()
                            .padding(.bottom, 20)
                    }
                }
            }
            else {
                Text("맛집. 추천받기!")
                    .customButtonFormat()
                    .padding(.bottom, 20)
            }
        }
    }
}
