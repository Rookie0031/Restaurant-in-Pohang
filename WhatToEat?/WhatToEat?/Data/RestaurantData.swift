//
//  RestaurantData.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/05/01.
//

import Foundation
import SwiftUI

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

