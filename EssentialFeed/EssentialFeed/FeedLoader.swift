//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/6/21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
