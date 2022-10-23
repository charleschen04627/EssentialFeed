//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/10/23.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
