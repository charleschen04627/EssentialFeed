//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/10/23.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
     
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
