//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by 陳明辰 on 2022/10/18.
//

import XCTest

private class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessageToView() {
        
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty)
    }
    
    // MARK: - Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }
}


