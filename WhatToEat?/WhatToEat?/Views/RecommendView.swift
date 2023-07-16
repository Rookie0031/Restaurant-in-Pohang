//
//  MainPageView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
import SwiftUI

struct RecommendView: View {

    // MARK: 현재 로컬 내에서 필터링 하도록 처리되어있는데, notion DB에 쿼리하도록 개선할 수 있음
    @State var foodCategoryFiltered : [Properties] = []
    @State var numberOfPeopleFiltered : [Properties] = []
    @State var priceRangeFiltered : [Properties] = []
    @State var locationCategoryFiltered : [Properties] = []
    @State var finalFilteredGroup : [Properties] = []
    
    @State var foodCategoryIndex : Int = 0
    @State var numberOfPeopleIndex : Int = 0
    @State var priceRangeIndex : Int = 0
    @State var locationCategoryIndex : Int = 0

    @State var isActive = false

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
            .navigationTitle("맛집 추천")
        }
    }
}
