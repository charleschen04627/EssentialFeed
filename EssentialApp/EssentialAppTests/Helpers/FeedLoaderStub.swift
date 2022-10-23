//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by 陳明辰 on 2022/10/23.
//

import Foundation
import EssentialFeed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
