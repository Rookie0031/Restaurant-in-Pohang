//
//  PostMatZip.swift
//  WhatToEat?
//
//  Created by 장지수 on 2023/02/11.
//

import SwiftUI

struct PostMatZip: View {
    @StateObject private var viewModel = PostMatZipViewModel()
    @StateObject var pictureModel = PictureViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("맛집 정보를 제보 중이에요!")
            } else {
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
                                    .onAppear {
                                        guard let jpegData = selectedImage.jpegData(compressionQuality: 0.1) else { return }
                                        viewModel.imageData = String(data: jpegData, encoding: .utf8) ?? "nil"
                                    }
                            } else {
                                    Image(systemName: "plus")
                                    .frame(width: UIScreen.main.bounds.width*0.9, height: 250, alignment: .center)
                                    .background(Color.backgroundGray)
                                    .cornerRadius(10)
                            }
                        }
                    } header: {
                        Text("맛집 사진")
                    }

                    Section {
                        HStack {
                            Label("음식점 이름:", systemImage: "house.circle")
                            Spacer()
                            TextField("음식점 이름", text: $viewModel.foodName)
                        }

                        HStack {
                            Label("음식종류", systemImage: "fork.knife.circle")
                            Spacer()
                            Picker("", selection: $viewModel.category) {
                                ForEach(foodCategory, id:\.self) { category in
                                    Text(category)
                                }
                            }
                        }

                        HStack {
                            Label("추천인원", systemImage: "person.2")
                            Spacer()
                            Picker("", selection: $viewModel.people) {
                                ForEach(peopleCategory, id:\.self) { category in
                                    Text(category)
                                }
                            }
                        }

                        HStack {
                            Label("가격대", systemImage: "tag.circle")
                            Spacer()
                            Picker("", selection: $viewModel.price) {
                                ForEach(priceCategory, id:\.self) { category in
                                    Text(category)
                                }
                            }
                        }

                        HStack {
                            Label("위치", systemImage: "location.circle")
                            Spacer()
                            Picker("", selection: $viewModel.location) {
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
                            if viewModel.description.isEmpty {
                                Text("후기를 입력해주세요")
                                    .foregroundColor(.black.opacity(0.6))
                                    .offset(y: -15)
                            }
                            TextEditor(text: $viewModel.description)
                                .font(.subheadline)
                                .frame(minHeight: 50)
                        }
                    } header: {
                        Text("후기")
                    }

                    Section {
                        Button {
                            viewModel.createNotionPage {
                                self.presentationMode.wrappedValue.dismiss()
                            }
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
