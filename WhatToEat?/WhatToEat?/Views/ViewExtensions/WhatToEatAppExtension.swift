//
//  WhatToEatAppExtension.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/09/30.
//

//MARK: 백엔드에서 처리될 수 있게 조사 필요
// 애초에 필요한 카테고리만 Notion에서 필터링해서 가져올 수 있을까??
extension WhatToEatApp {
    func setFoodCategory() {
        
        var western : [Properties] = []
        var korean : [Properties] = []
        var chinese : [Properties] = []
        var japanese : [Properties] = []
        var cafe : [Properties] = []
        var asian : [Properties] = []

        for data in rootModelData.localData {
            switch data.category.select.name {
            case "양식" :
                western.append(data)
            case "한식" :
                korean.append(data)
            case "중식" :
                chinese.append(data)
            case "일식" :
                japanese.append(data)
            case "기타" :
                asian.append(data)
            case "카페/디저트" :
                cafe.append(data)
            default :
                print("정보에 오류가 있는 거 같아요.")
            }
        }

        if !rootModelData.localData.isEmpty {
            rootModelData.categoryFood.append(western)
            rootModelData.categoryFood.append(korean)
            rootModelData.categoryFood.append(chinese)
            rootModelData.categoryFood.append(japanese)
            rootModelData.categoryFood.append(cafe)
            rootModelData.categoryFood.append(asian)
        }
    }
}
