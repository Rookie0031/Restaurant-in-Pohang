//
//  PictureViewModel.swift
//  WhatToEat?
//
//  Created by 장지수 on 2023/02/11.
//

import SwiftUI
import Foundation
import Combine

final class PictureViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: PhotoPicker.Source = .library
    @Published var showCameraAlert = false
    @Published var cameraError: PhotoPicker.CameraErrorType?
    @Published var imageName: String = ""
    @Published var myImages: [MyPicture] = []
    @Published var isLoaded: Bool = false
    
    func showPhotoPicker() {
        do {
            if source == .camera {
                try PhotoPicker.checkPermissions()
            }
            showPicker = true
        } catch {
            showCameraAlert = true
            cameraError = PhotoPicker.CameraErrorType(error: error as! PhotoPicker.PickerError)
        }
    }
    
    func reset() {
        image = nil
        imageName = ""
    }
}

final class KeyboardHandler: ObservableObject {
    @Published private(set) var keyboardHeight: CGFloat = 0
    
    private var cancellabel: AnyCancellable?
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height }
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in CGFloat.zero }
    
    init() {
        cancellabel = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.self.keyboardHeight, on: self)
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

