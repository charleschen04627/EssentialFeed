//
//  FeedViewControllerTests+Localization.swift
//  EssentialFeediOSTests
//
//  Created by 陳明辰 on 2022/10/6.
//

import EssentialFeediOS
import XCTest

extension FeedUIIntegrationTests {
    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedViewController.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in talbe: \(table)", file: file, line: line)
        }
        return value
    }
}