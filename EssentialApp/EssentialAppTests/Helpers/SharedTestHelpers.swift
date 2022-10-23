//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by 陳明辰 on 2022/10/22.
//

import Foundation
import EssentialFeed

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func anyURL() -> URL {
    return URL(string: "http://a-url.com")!
}

func uniqueFeed() -> [FeedImage] {
    return [FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())]
}
