//
//  File.swift
//  WhatToEat?
//
//  Created by Jisu Jang on 2022/11/27.
//
import Kingfisher
import Foundation

struct RetryWhenFailed: RetryStrategy {
    func retry(context: Kingfisher.RetryContext, retryHandler: @escaping (Kingfisher.RetryDecision) -> Void) {
        print("===============")
        print("Retry has occured")
        print("===============")
    }
}
