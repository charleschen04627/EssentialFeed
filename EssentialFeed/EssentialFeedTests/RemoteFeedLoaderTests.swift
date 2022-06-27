//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by 陳明辰 on 2022/6/22.
//

import XCTest
import EssentialFeed

/// Step 1: Make the shared instance a variable
/// Step 2: Move the test logic from the RemoteFeedLoader to HTTPClient
/// Step 3: Move the test logic to a new subclass of the HTTPClient
/// Step 4: Swap the HTTPClient shared instance with the spy subclass during tests
/// Step 5: Remove HTTPClient private initializer since it's not a singleton anymore
/// Done! We don't have a Singleton anymore and the test logic is now in a test type(the spy)

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertTrue(client.requestedURLs.isEmpty )
    }
    
    func test_load_requestsDataFromURL () {
        let url = URL(string: "https://a-given-url.com")!
        
        /// 1 Arrange: "Given a client and a sut"
        let (sut, client) = makeSUT(url: url)
        
        /// 2 Act: "when we invoke sut.load()"
        sut.load { _ in }
        
        /// 3 Assert: "Then assert that a URL request was initiated in the client"
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    /// 002 : Asserting a Captured Value Is Not Enough + Cross-Module Access Control
    func test_loadTwice_requestsDataFromURLTwice () {
        let url = URL(string: "https://a-given-url.com")!
        
        let (sut, client) = makeSUT(url: url)
        
        sut.load { _ in }
        sut.load { _ in }
        
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    /// 003 : Handling Errors + Stubbing vs. Spying + Eliminating Invalid Paths
    /// Start about client response
    func test_load_deliversErrorOnClientError() {
//        let (sut, client) = makeSUT()
//        client.error = NSError(domain: "Test", code: 0)
//        
//        var capturedErrors = [RemoteFeedLoader.Error]()
//        sut.load { capturedErrors.append($0) }
//        
//        XCTAssertEqual(capturedErrors, [.connectivity])
        
        /// 這個測試有一個狀況
        /// "在呼叫load()之前，先把error塞給client"
        /// 此行為不符合呼叫API時的"非同步"特性
    }
    
    func test_load_deliversErrorOnClientErrorWithAsynchornously() {
        let (sut, client) = makeSUT()
        
        var capturedErrors = [RemoteFeedLoader.Error]()
        sut.load {
            capturedErrors.append($0)
        }
        let clientError = NSError(domain: "Test", code: 0)
        client.complete(with: clientError)
        
        XCTAssertEqual(capturedErrors, [.connectivity])
    }
    
    func test_load_deliversErrorOnNon200HTTPResponse() {
        let (sut, client) = makeSUT()
        
        let samples = [199, 201, 300, 400, 500]
        
        samples.enumerated().forEach { index, code in
            var capturedErrors = [RemoteFeedLoader.Error]()
            sut.load {
                capturedErrors.append($0)
            }
            
            client.complete(withStatusCode: code, at: index)
            XCTAssertEqual(capturedErrors, [.invalidData])
            
            capturedErrors = []
        }
    }
    
    // MARK: - Helpers
    private func makeSUT(url: URL = URL(string: "https://a-rul.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
        
    private class HTTPClientSpy: HTTPClient {
        private var messages = [(url: URL, completion: (Error?, HTTPURLResponse?) -> Void)]()
        
        var requestedURLs: [URL] {
            return messages.map {$0.url}
        }
        
        func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void) {
            messages.append((url, completion))
        }
        
        func complete(with error: Error, at index: Int = 0) {
            messages[index].completion(error, nil)
        }
        
        func complete(withStatusCode code: Int, at index: Int = 0) {
            let response = HTTPURLResponse(url: requestedURLs[index],
                                           statusCode: code,
                                           httpVersion: nil,
                                           headerFields: nil)
            messages[index].completion(nil, response)
        }
    }
}
