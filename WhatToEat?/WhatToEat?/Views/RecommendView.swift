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

    let foodCategory : [String] = ["양식","한식","중식","일식","기타", "카페/디저트"]
    let peopleCategory : [String] = ["혼밥!","둘이서", "3~4명", "단체로!"]
    let priceCategory : [String] = ["6000원 이하", "6000원~8000원", "8000원~10000원", "10000원 이상"]
    let locationCategory : [String] = ["포항공대 내부", "효자시장", "SK아파트 근처", "시청근처", "이동", "유강", "기타"]
    
    @State private var filteredGroupA : [RestaurantData] = []
    @State private var filteredGroupB : [RestaurantData] = []
    @State private var filteredGroupC : [RestaurantData] = []
    @State private var filteredGroupD : [RestaurantData] = []
    @State private var filteredGroupFinal : [RestaurantData] = []
    
    @State private var currentIndex1 : Int = 0
    @State private var currentIndex2 : Int = 0
    @State private var currentIndex3 : Int = 0
    @State private var currentIndex4 : Int = 0
    
    @State private var isListViewActive = false
    
    @State private var isActive = false
    @State private var isNill : Bool = false
    
    @EnvironmentObject var modelData : ModelData

    var body: some View {
        NavigationView {
                VStack(alignment: .center, spacing: 30) {
                    foodTypeQuestion()
                    numberOfPeopleQuestion()
                    priceRangeQuestion()
                    locationPreferenceQuestion()
                    Spacer()
                    getRecommendation()
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
                    ForEach(foodCategory, id: \.self) { value in
                        Button(action: {
                            currentIndex1 = foodCategory.firstIndex(of: value)!

                            filteredGroupA = modelData.restaurants.filter { restaurant in
                                restaurant.category == value }
                        }) {
                            foodCategory.firstIndex(of: value)! == currentIndex1 ?

                            Text(value)
                                .customCategory()
                                .foregroundColor(.white )
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.lightOrange))
                            :
                            Text(value)
                                .customCategory()
                                .foregroundColor(.black)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
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
                        filteredGroupB = modelData.restaurants.filter { restaurant in
                            restaurant.people.contains(value) }
                    }) {
                        peopleCategory.firstIndex(of: value)! == currentIndex2 ?

                        Text(value)
                            .customCategory()
                            .foregroundColor(.white )
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.lightOrange))
                        :
                        Text(value)
                            .customCategory()
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
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
                            filteredGroupC = modelData.restaurants.filter { restaurant in
                                restaurant.price == value }
                        }) {
                            priceCategory.firstIndex(of: value)! == currentIndex3 ?

                            Text(value)
                                .customCategory()
                                .foregroundColor(.white )
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.lightOrange))
                            :
                            Text(value)
                                .customCategory()
                                .foregroundColor(.black)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
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
                            filteredGroupD = modelData.restaurants.filter { restaurant in
                                restaurant.location == value }
                        }) {
                            locationCategory.firstIndex(of: value)! == currentIndex4 ?

                            Text(value)
                                .customCategory()
                                .foregroundColor(.white )
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.lightOrange))
                            :
                            Text(value)
                                .customCategory()
                                .foregroundColor(.black)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        }
                        .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 0)))
                    }
                }
            }
            Divider()
        }
    }

    private func getRecommendation() -> some View {
        NavigationLink(destination: FoodInfoView(foodInfo: filteredGroupFinal.isEmpty ? modelData.nillData[0] : filteredGroupFinal.randomElement()!), isActive: $isActive) {
            Button(action: {
                isActive = true
                filteredGroupFinal = filteredGroupA.filter{filteredGroupB.contains($0)}.filter{filteredGroupC.contains($0)}.filter{filteredGroupD.contains($0)}
            }) {
                Text("맛집 추천받기!")
                    .customButtonFormat()
            }
        }
        .padding(.bottom, 20)
    }
}
