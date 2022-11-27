//
//  CategoryData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/09/30.
//

import Foundation

enum FoodCategory: String, CaseIterable {
    case western = "양식"
    case korean = "한식"
    case chinese = "중식"
    case japanese = "일식"
    case dessert = "카페/디저트"
    case others = "기타"
}

enum PeopleCategory: String, CaseIterable {
    case single = "혼밥"
    case double = "둘이서"
    case threeOrFour = "3~4명"
    case many = "단체로"
}

enum PriceCategory: String, CaseIterable {
    case cheap = "6000원 이하"
    case normal = "6000~8000원"
    case expensive = "8000원~10000원"
    case luxurious = "10000원 이상"
}

enum LocationCategory: String, CaseIterable {
    case postech = "포항공대 내부"
    case market = "효자시장"
    case skAPT = "SK아파트 근처"
    case cityHall = "시청근처"
    case edong = "이동"
    case uKang = "유강"
    case other = "기타"
}
