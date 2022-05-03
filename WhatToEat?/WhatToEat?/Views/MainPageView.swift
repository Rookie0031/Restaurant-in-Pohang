//
//  MainPageView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/04/29.
//

import SwiftUI

struct MainPageView: View {
    
    var foodCategory : [String] = ["양식","한식","중식","일식","아시안", "카페/디저트"]
    var peopleCategory : [String] = ["혼밥!","둘이서", "3~4명", "단체로!"]
    var priceCategory : [String] = ["6000원 이하", "6000원~8000원", "8000원~10000원", "10000원 이상"]
    var locationCategory : [String] = ["포항공대 내부", "효자시장", "SK아파트 근처", "시청근처", "이동", "유강", "기타"]
    
    @State var currentIndex1 : Int = 0
    @State var currentIndex2 : Int = 0
    @State var currentIndex3 : Int = 0
    @State var currentIndex4 : Int = 0
    
    @State var isListViewActive = false
    
    @State var isActive = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            

            Group {
                Text("어떤 음식이 땡기나요?")
                    .customInfoTitle()
                    .padding(.top, 20)
                    .frame(width: 300, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(foodCategory, id: \.self) { value in
                            Button(action: {
                                currentIndex1 = foodCategory.firstIndex(of: value)!
                            }) {
                                foodCategory.firstIndex(of: value)! == currentIndex1 ?
                                
                                Text(value)
                                    .customCategory()
                                    .foregroundColor(.white )
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                                :
                                Text(value)
                                    .customCategory()
                                    .foregroundColor(.black)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                            }
                            .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 5)))
                        }
                    }
                }
                .frame(width: 300, height: 30)

                
                Divider()
                    .frame(width: 300)
                
            }
            
            Group {
                Text("몇명이서 먹을건가요?")
                    .customInfoTitle()
                    .frame(width: 300, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(peopleCategory, id: \.self) { value in
                            Button(action: {
                                currentIndex2 = peopleCategory.firstIndex(of: value)!
                            }) {
                                peopleCategory.firstIndex(of: value)! == currentIndex2 ?
                                
                                Text(value)
                                    .customCategory()
                                    .foregroundColor(.white )
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                                :
                                Text(value)
                                    .customCategory()
                                    .foregroundColor(.black)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                            }
                            .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 5)))
                        }
                    }
                }
                .frame(width: 300, height: 30)
                
                Divider()
                    .frame(width: 300)
            }
            
            
            Group {
                Text("원하는 가격대가 있나요?")
                    .customInfoTitle()
                    .frame(width: 300, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(priceCategory, id: \.self) { value in
                            Button(action: {
                                currentIndex3 = priceCategory.firstIndex(of: value)!
                            }) {
                                priceCategory.firstIndex(of: value)! == currentIndex3 ?
                                
                                Text(value)
                                    .customCategory()
                                    .foregroundColor(.white )
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                                :
                                Text(value)
                                    .customCategory()
                                    .foregroundColor(.black)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                            }
                            .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 5)))
                        }
                    }
                }
                .frame(width: 300, height: 30)
                
                Divider()
                    .frame(width: 300)
            }
            
            
            
            Group {
                Text("선호하는 위치가 있나요?")
                    .customInfoTitle()
                    .frame(width: 300, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(locationCategory, id: \.self) { value in
                            Button(action: {
                                currentIndex4 = locationCategory.firstIndex(of: value)!
                            }) {
                                locationCategory.firstIndex(of: value)! == currentIndex4 ?
                                
                                Text(value)
                                    .customCategory()
                                    .foregroundColor(.white )
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
                                :
                                Text(value)
                                    .customCategory()
                                    .foregroundColor(.black)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                            }
                            .padding(EdgeInsets(.init(top:5, leading: 2, bottom: 5, trailing: 5)))
                        }
                    }
                }
                .frame(width: 300, height: 30)
                
                Divider()
                    .frame(width: 300)
            }
            
            
            Spacer()
            
            NavigationLink(destination: LoadingView(), isActive: $isActive) {
                Button(action: {
                    isActive = true
                }) {
                    Text("맛집 추천받기!")
                        .customButtonFormat()
                }
            }
            .padding()

        }

    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

