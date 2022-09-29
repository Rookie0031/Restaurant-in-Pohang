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
    @State var foodCategoryFiltered : [Properties] = []
    @State var numberOfPeopleFiltered : [Properties] = []
    @State var priceRangeFiltered : [Properties] = []
    @State var locationCategoryFiltered : [Properties] = []
    @State var finalFilteredGroup : [Properties] = []
    
    @State var foodCategoryIndex : Int = 0
    @State var numberOfPeopleIndex : Int = 0
    @State var priceRangeIndex : Int = 0
    @State var locationCategoryIndex : Int = 0

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
}
