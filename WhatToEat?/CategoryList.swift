//
//  Category.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import Foundation


class CartegoryList : ObservableObject {
    enum foodCagtegory: String {
        case Western = "양식"
        case Korean = "한식"
        case Chinese = "중식"
        case Japanes = "일식"
        case Asian = "기타"
        case Dessert = "카페/디저트"

    }

    enum peopleCategory: String {
        case solo = ""
        case couple = "Europe"
        case smallGroup = "South America"
        case bigGroup = "North America"

    }


    enum priceCategory: String {
        case cheap = "6000원 이하"
        case mediumPrice = "6000원~8000원"
        case expensive  = "8000원~10000원"
        case luxurious = "10000원 이상"
    }


    enum locationCategory: String {
        case school = "포항공내 내부"
        case market = "효자시장"
        case skApart = "SK아파트 근처"
        case cityHall = "시청근처"
        case edong = "이동"
        case ukang = "유강"
        case others = "기타"
    }

    
    
}
