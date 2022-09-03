//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/9/3.
//

import Foundation

public class CoreDataFeedStore: FeedStore {
    public init() {}
    
    public func deleteCacheFeed(completion: @escaping DeletionCompletion) {
        
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
}
