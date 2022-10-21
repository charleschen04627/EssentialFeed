//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/10/21.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
