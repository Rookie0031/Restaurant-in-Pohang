//
//  extension.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2023/09/04.
//
import Kingfisher
import Foundation

extension KFImageProtocol {

    public init(_ url: URL?, _ cacheKey: String) {
        self.init(source: url?.convertToSource(overrideCacheKey: cacheKey))
    }
}
