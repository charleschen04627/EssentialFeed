//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/6/21.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
