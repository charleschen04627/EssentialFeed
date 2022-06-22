//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by 陳明辰 on 2022/6/22.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    func load() {
        client.get(from: url)
    }
}

/// Step 1: Make the shared instance a variable
/// Step 2: Move the test logic from the RemoteFeedLoader to HTTPClient
/// Step 3: Move the test logic to a new subclass of the HTTPClient
/// Step 4: Swap the HTTPClient shared instance with the spy subclass during tests
/// Step 5: Remove HTTPClient private initializer since it's not a singleton anymore
/// Done! We don't have a Singleton anymore and the test logic is now in a test type(the spy)

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL () {
        let url = URL(string: "https://a-given-url.com")!
        
        /// 1 Arrange: "Given a client and a sut"
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        /// 2 Act: "when we invoke sut.load()"
        sut.load()
        
        /// 3 Assert: "Then assert that a URL request was initiated in the client"
        XCTAssertEqual(client.requestedURL, url)
    }
}
