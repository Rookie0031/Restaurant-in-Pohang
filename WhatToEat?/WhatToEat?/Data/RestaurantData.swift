//
//  RestaurantData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import Foundation
import SwiftUI
import CoreLocation

struct RestaurantData: Hashable, Codable {
    var id: Int
    var name: String
    var description : String
    var category : String
    var people: String
    var price: String
    var location: String
    var transportation : String
    var isFavorite : Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

}

//{
//    "id": 1,
//    "name": "참서리",
//    "description": "음식이 맛있어요!",
//    "category": "한식",
//    "people": "3~4명",
//    "price": "6000원~8000원",
//    "location": "효자시장",
//    "transportation" : "자차"
//    "isFavorite": false,
//    "imageName": "참서리"
//},
