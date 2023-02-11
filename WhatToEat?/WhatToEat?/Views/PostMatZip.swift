//
//  PostMatZip.swift
//  WhatToEat?
//
//  Created by 장지수 on 2023/02/11.
//
import SwiftUI

struct PostMatZip: View {
    @State var currentIndex: Int = 0
    @State var foodCategoryData: String = ""
    @State var peopleCategoryData: String = ""
    @State var priceCategoryData: String = ""
    @State var locationCategoryData: String = ""
    @State private var review: String = ""
    @StateObject var pictureModel = PictureViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button {
                        pictureModel.source = .library
                        pictureModel.showPhotoPicker()
                    } label: {
                        if let selectedImage = pictureModel.image {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .frame(width: 300, height: 250, alignment: .center)
                                .scaledToFit()
                                .cornerRadius(10)
                        } else {
                            Image(systemName: "plus")
                                .frame(width: 300, height: 250, alignment: .center)
                                .cornerRadius(10)
                        }
                    }
                } header: {
                    Text("맛집 사진")
                }
                
                Section {
                    HStack {
                        Label("음식종류", systemImage: "fork.knife.circle")
                        Spacer()
                        Picker("", selection: $foodCategoryData) {
                            ForEach(foodCategory, id:\.self) { category in
                                Text(category)
                            }
                        }
                    }
                    
                    HStack {
                        Label("추천인원", systemImage: "person.2")
                        Spacer()
                        Picker("", selection: $peopleCategoryData) {
                            ForEach(peopleCategory, id:\.self) { category in
                                Text(category)
                            }
                        }
                    }
                    
                    HStack {
                        Label("가격대", systemImage: "tag.circle")
                        Spacer()
                        Picker("", selection: $priceCategoryData) {
                            ForEach(priceCategory, id:\.self) { category in
                                Text(category)
                            }
                        }
                    }
                    
                    HStack {
                        Label("위치", systemImage: "location.circle")
                        Spacer()
                        Picker("", selection: $locationCategoryData) {
                            ForEach(locationCategory, id:\.self) { category in
                                Text(category)
                            }
                        }
                    }
                    
                } header: {
                    Text("음식 정보")
                }
                
                Section {
                    ZStack(alignment: .leading) {
                        if review.isEmpty {
                            Text("후기를 입력해주세요")
                                .foregroundColor(.black.opacity(0.6))
                        }
                        TextEditor(text: $review)
                            .font(.subheadline)
                    }
                } header: {
                    Text("후기")
                }

                Section {
                    Button {
                        print("데이터 전송하기")
                    } label: {
                        Text("제보하기")
                            .font(.system(size: 20, weight: .bold))
                            .customButtonFormat()
                            .padding(.top, -15)
                    }
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("맛집 제보")
            .sheet(isPresented: $pictureModel.showPicker) {
                PicturePicker(sourceType: pictureModel.source == .library ? .photoLibrary : .camera, selectedImage: $pictureModel.image)
                    .ignoresSafeArea()
            }
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PostMatZip()
    }
}


extension PostMatZip {
    var foodCategory : [String] {
        return ["선택","양식","한식","중식","일식","카페/디저트", "기타"]
    }
    var peopleCategory : [String] {
        return ["선택","혼밥","둘이서", "3~4명", "단체로"]
    }
    var priceCategory : [String] {
        return ["선택","6000원 이하", "6000원~8000원", "8000원~10000원", "10000원 이상"]
    }
    var locationCategory : [String] {
        return ["선택","포항공대 내부", "효자시장", "SK아파트 근처", "시청근처", "이동", "유강", "기타"]
    }
}
