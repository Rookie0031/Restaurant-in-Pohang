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
    var category : String
    var price: Int
    var people: String
    var location: String
    var description: String
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

}
