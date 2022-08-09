//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by 陳明辰 on 2022/8/9.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}


func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
