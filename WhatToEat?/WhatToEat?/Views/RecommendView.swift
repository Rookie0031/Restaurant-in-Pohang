//
//  MainPageView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
import SwiftUI

struct RecommendView: View {

    // MARK: 맛집 추천 로직 구조와, 카테고리 선택 구조상 State Wrapper property가 이렇게 많이 필요하게 되었다.
    @ObservedObject var modelData : ModelData
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
