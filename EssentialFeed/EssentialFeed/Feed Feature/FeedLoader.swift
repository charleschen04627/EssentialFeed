//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/6/21.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error> 

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
