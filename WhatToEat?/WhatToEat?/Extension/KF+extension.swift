//
//  extension.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2023/09/04.
//
import Kingfisher
import Foundation

extension KF {
    public struct ImageResource: Resource {

        public init(downloadURL: URL, cacheKey: String) {
            self.downloadURL = downloadURL
            self.cacheKey = cacheKey
        }

        public let cacheKey: String

        public let downloadURL: URL
    }
}

extension Resource {
    public func convertToSource(overrideCacheKey: String) -> Source {
        let key = overrideCacheKey
        return downloadURL.isFileURL ?
            .provider(LocalFileImageDataProvider(fileURL: downloadURL, cacheKey: key)) :
            .network(KF.ImageResource(downloadURL: downloadURL, cacheKey: key))
    }
}

extension KFImageProtocol {

    public init(_ url: URL?, _ cacheKey: String) {
        self.init(source: url?.convertToSource(overrideCacheKey: cacheKey))
    }
}
