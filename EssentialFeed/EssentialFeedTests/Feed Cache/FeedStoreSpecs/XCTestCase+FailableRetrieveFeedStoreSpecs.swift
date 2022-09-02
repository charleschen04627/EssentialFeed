//
//  XCTestCase+FailableRetrieveFeedStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by 陳明辰 on 2022/9/2.
//

import XCTest
import EssentialFeed

extension FailableRetrieveFeedStoreSpecs where Self: XCTestCase {
    func assertThatRetrieveDeliversFailureOnRetrievalError(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {    
        expect(sut, toRetrieve: .failure(anyNSError()), file: file, line: line)
    }
    
    
    func assertThatRetrieveHasNoSideEffectsOnFailure(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
        expect(sut, toRetrieveTwice: .failure(anyNSError()), file: file, line: line)
    }
}
