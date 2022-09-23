////
////  RecommendData.swift
////  WhatToEat?
////
////  Created by Jisu Jang on 2022/09/22.
////
//
import Foundation

extension RecommendView {
    var foodCategory : [String] {
        return ["양식","한식","중식","일식","기타", "카페/디저트"]
    }
    var peopleCategory : [String] {
        return ["혼밥!","둘이서", "3~4명", "단체로!"]
    }
    var priceCategory : [String] {
        return ["6000원 이하", "6000원~8000원", "8000원~10000원", "10000원 이상"]
    }
    var locationCategory : [String] {
        return ["포항공대 내부", "효자시장", "SK아파트 근처", "시청근처", "이동", "유강", "기타"]
    }
}
//import Foundation
//
//extension RecommendView {
//    var foodCategory : [String] {
//        return ["양식","한식","중식","일식","기타", "카페/디저트"]
//    }
//
//    var peopleCategory : [String] {
//        return ["혼밥!","둘이서", "3~4명", "단체로!"]
//    }
//
//    var priceCategory : [String] {
//        return ["6000원 이하", "6000원~8000원", "8000원~10000원", "10000원 이상"]
//    }
//
//    var locationCategory : [String] {
//        return ["포항공대 내부", "효자시장", "SK아파트 근처", "시청근처", "이동", "유강", "기타"]
//    }
//
//    @State private var filteredGroupA : [Properties] {
//        return []
//    }
//
//    @State private var filteredGroupB : [Properties] {
//        return []
//    }
//
//    @State private var filteredGroupC : [Properties] {
//        return []
//    }
//
//    @State private var filteredGroupD : [Properties] {
//        return []
//    }
//
//    @State private var filteredGroupFinal : [Properties] {
//        return []
//    }
//
//    @State private var currentIndex1 : Int = 0
//    @State private var currentIndex2 : Int = 0
//    @State private var currentIndex3 : Int = 0
//    @State private var currentIndex4 : Int = 0
//
//    @State private var isListViewActive = false
//    @State private var isNill : Bool = false
//
//    @EnvironmentObject var modelData : ModelData
//}
