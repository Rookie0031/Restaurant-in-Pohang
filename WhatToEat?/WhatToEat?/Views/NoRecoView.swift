//
//  NoRecoView.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/05.
//
//
import SwiftUI

struct NoRecoView: View {
    
    @State var testfor = false
    @EnvironmentObject var modelData : ModelData
    var body: some View {
        
        VStack {
            
            Spacer()
            Text("아쉽게도 원하시는 맛집이 없어요...")
                .font(.system(size: 20).weight(.heavy))
                .padding(.bottom,50)
            
            Image("sorry1")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()
            
            Group {
                NavigationLink{
                    FoodListView()
                        .navigationTitle("이번에는 꼭!")
                } label:{
                    Text("다른 맛집리스트도 살펴볼래요!")
                        .customButtonFormat()
                }
                
                NavigationLink{
                    BucketListView()
                        .navigationTitle("여기서 하나 골라!")
                } label: {
                    Text("먹킷리스트로 가볼래요!")
                        .customButtonFormat()
                }
                .padding(.bottom, 50)
            }
        }
    }
    
}
//
//struct NoRecoView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoRecoView()
//    }
//}
