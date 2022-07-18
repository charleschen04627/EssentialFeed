//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by 陳明辰 on 2022/7/18.
//

import XCTest

class LocalFeedLoader {
    init(store: FeedStore) {
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
