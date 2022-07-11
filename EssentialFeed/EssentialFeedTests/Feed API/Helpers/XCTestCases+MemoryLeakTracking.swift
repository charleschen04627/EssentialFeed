//
//  XCTestCases+MemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by 陳明辰 on 2022/7/11.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instanc should have been deallocaed. Potential memory leak.", file: file, line: line)
        }
    }
}
