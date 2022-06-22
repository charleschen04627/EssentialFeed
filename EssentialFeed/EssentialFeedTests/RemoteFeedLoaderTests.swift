//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by 陳明辰 on 2022/6/22.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shares.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let shares = HTTPClient()
    
    private init () {}
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shares
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL () {
        /// 1 Arrange: "Given a client and a sut"
        let client = HTTPClient.shares
        let sut = RemoteFeedLoader()
        
        /// 2 Act: "when we invoke sut.load()"
        sut.load()
        
        /// 3 Assert: "Then assert that a URL request was initiated in the client"
        XCTAssertNotNil(client.requestedURL)
    }
}
