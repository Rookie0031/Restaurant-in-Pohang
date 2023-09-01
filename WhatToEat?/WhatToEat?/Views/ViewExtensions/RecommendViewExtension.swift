////
////  RecommendData.swift
////  WhatToEat?
////
////  Created by Jisu Jang on 2022/09/22.
import SwiftUI

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

//MARK: View inside the stack
extension RecommendView {
    func foodTypeQuestion() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("어떤 종류가 먹고 싶나요?")
                .customInfoTitle()
            
            //MARK: ScrollView 데이터를 외부에서 주입하는 방식으로 하면 보일러 플레이트 코드를 줄일 수 있을듯?
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    //TODO: 강제언래핑 삭제
                    ForEach(foodCategory, id: \.self) { category in
                        Button(action: {
                            
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
            NavigationLink(
                destination: AnyView(getDestination().navigationBarTitleDisplayMode(.inline)),
                isActive: $isActive) {
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
    }
    
    func getDestination() -> any View {
        if finalFilteredGroup.isEmpty {
            return NoRecommendationView()
        } else {
            //MARK: 강제언래핑 삭제
            return RestaurantInfoView(viewModel: FoodListVM(), foodInformation: finalFilteredGroup.randomElement()!)
        }
    }
    
    func getRecommendation() {
//        finalFilteredGroup = self.foodCategoryFiltered.filter{numberOfPeopleFiltered.contains($0)}.filter{priceRangeFiltered.contains($0)}.filter{locationCategoryFiltered.contains($0)}
    }
}
