////
////  RecommendData.swift
////  WhatToEat?
////
////  Created by Jisu Jang on 2022/09/22.
import Foundation
import SwiftUI

// MARK: Case 분류해놓았으나, raw value를 써야하는 경우가 너무 많아 일단 array로 처리해놓음
// 굳이 이런 경우 case로 바꿔야하는가?
extension RecommendView {
    var foodCategory : [String] {
        return ["양식","한식","중식","일식","카페/디저트", "기타"]
    }
    var peopleCategory : [String] {
        return ["혼밥","둘이서", "3~4명", "단체로"]
    }
    var priceCategory : [String] {
        return ["6000원 이하", "6000원~8000원", "8000원~10000원", "10000원 이상"]
    }
    var locationCategory : [String] {
        return ["포항공대 내부", "효자시장", "SK아파트 근처", "시청근처", "이동", "유강", "기타"]
    }
}

// functions related to view
extension RecommendView {
    func foodTypeQuestion() -> some View {
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

    func numberOfPeopleQuestion() -> some View {
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

    func priceRangeQuestion() -> some View {
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

    func locationPreferenceQuestion() -> some View {
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

    func getRecommendationButton() -> some View {
        VStack {
            if !modelData.localData.isEmpty {
                NavigationLink(destination: AnyView(getDestination()), isActive: $isActive) {
                    Button {
                        getRecommendation()
                        isActive.toggle()
                    } label: {
                        Text("추천받기")
                            .font(.system(size: 20, weight: .bold))
                            .customButtonFormat()
                            .padding(.bottom, 20)
                    }
                }
            }
            else {
                Text("맛집 추천받기")
                    .font(.system(size: 20, weight: .bold))
                    .customButtonFormat()
                    .padding(.bottom, 20)
            }
        }
    }

    func getDestination() -> any View {
        if finalFilteredGroup.isEmpty {
            return NoRecommendationView()
        } else {
            return RestaurantInfoView(foodInformation: finalFilteredGroup.randomElement()!)
        }
    }

    func getRecommendation() {
        finalFilteredGroup = self.foodCategoryFiltered.filter{numberOfPeopleFiltered.contains($0)}.filter{priceRangeFiltered.contains($0)}.filter{locationCategoryFiltered.contains($0)}
    }
}
