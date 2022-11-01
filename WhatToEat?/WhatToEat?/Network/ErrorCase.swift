//
//  ErrorCase.swift
//  WhatToEat?
//
//  Created by 장지수 on 2022/10/30.
//

import Foundation

enum NetworkError: LocalizedError {
    case wrongURL
    case responseError
    case decoidngError
    
    var errorDescription: String? {
        switch self {
        case .wrongURL:
            return NSLocalizedString("This is wrong URL", comment: "This is wrong URL")
        case .responseError:
            return NSLocalizedString("This is wrong response", comment: "This is wrong response")
        case .decoidngError:
            return NSLocalizedString("Decoding error has occured", comment: "Decoding error has occured")
        }
    }
}

enum DataError: LocalizedError {
    case unsupportedImageData
    case unsupportedURL

    var errorDescription: String? {
        switch self {
        case .unsupportedImageData:
            return NSLocalizedString("This is wrong image", comment: "This is wrong image Data")
        case .unsupportedURL:
            return NSLocalizedString("This is unsupported URL", comment: "This is unsupported URL")
        }

    }
}
