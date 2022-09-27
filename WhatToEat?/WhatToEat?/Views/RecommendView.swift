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
    @State private var foodCategoryFiltered : [Properties] = []
    @State private var numberOfPeopleFiltered : [Properties] = []
    @State private var priceRangeFiltered : [Properties] = []
    @State private var locationCategoryFiltered : [Properties] = []
    @State private var finalFilteredGroup : [Properties] = []
    
    @State private var foodCategoryIndex : Int = 0
    @State private var numberOfPeopleIndex : Int = 0
    @State private var priceRangeIndex : Int = 0
    @State private var locationCategoryIndex : Int = 0

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
                            foodCategoryIndex = foodCategory.firstIndex(of: category)!
                            foodCategoryFiltered = modelData.localData.filter { $0.category.select.name == category }
                        }) {
                            Text(category)
                                .customCategory()
                                .foregroundColor( foodCategory.firstIndex(of: category)! == foodCategoryIndex ? .white : .black )
                                .background(RoundedRectangle(cornerRadius: 10).fill( foodCategory.firstIndex(of: category)! == foodCategoryIndex ? Color.lightOrange : .white))
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
                        numberOfPeopleIndex = peopleCategory.firstIndex(of: value)!
                        for foodData in modelData.localData {
                            var joinedString = ""
                            for detailedData in foodData.people.multiSelect {
                                joinedString += detailedData.name
                            }
                            if joinedString.contains(value) {
                                numberOfPeopleFiltered.append(foodData)
                            }
                        }
                    }) {
                        Text(value)
                            .customCategory()
                            .foregroundColor(peopleCategory.firstIndex(of: value)! == numberOfPeopleIndex ? .white : .black)
                            .background(RoundedRectangle(cornerRadius: 10).fill(peopleCategory.firstIndex(of: value)! == numberOfPeopleIndex ? .orange : .white))
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
                            priceRangeIndex = priceCategory.firstIndex(of: value)!
                            priceRangeFiltered = modelData.localData.filter { restaurant in
                                restaurant.price.select.name == value }
                        }) {
                            Text(value)
                                .customCategory()
                                .foregroundColor(priceCategory.firstIndex(of: value)! == priceRangeIndex ? .white : .black)
                                .background(RoundedRectangle(cornerRadius: 10).fill(priceCategory.firstIndex(of: value)! == priceRangeIndex ? .orange : .white))
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
                            locationCategoryIndex = locationCategory.firstIndex(of: value)!
                            locationCategoryFiltered = modelData.localData.filter { restaurant in
                                restaurant.location.richText.first!.text.content == value }
                            getRecommendation()
                        }) {
                            Text(value)
                                .customCategory()
                                .foregroundColor(locationCategory.firstIndex(of: value)! == locationCategoryIndex ? .white : .black)
                                .background(RoundedRectangle(cornerRadius: 10).fill(locationCategory.firstIndex(of: value)! == locationCategoryIndex ? .orange : .white))
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
            if !modelData.localData.isEmpty {
                NavigationLink(destination: AnyView(getDestination())) {
                    Text("맛집. 추천받기!")
                        .customButtonFormat()
                        .padding(.bottom, 20)
                }
            }
            else {
                Text("맛집. 추천받기!")
                    .customButtonFormat()
                    .padding(.bottom, 20)
            }
        }
    }

    private func getDestination() -> any View {
        if finalFilteredGroup.isEmpty {
            return NoRecommendationView()
        } else {
            return RestaurantInfoView(foodInformation: finalFilteredGroup.randomElement()!)
        }
    }

    private func getRecommendation() {
        finalFilteredGroup = self.foodCategoryFiltered.filter{numberOfPeopleFiltered.contains($0)}.filter{priceRangeFiltered.contains($0)}.filter{locationCategoryFiltered.contains($0)}
    }
}
