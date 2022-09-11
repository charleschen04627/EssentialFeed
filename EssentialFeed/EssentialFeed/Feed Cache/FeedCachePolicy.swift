//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/8/20.
//

import Foundation

final class FeedCachePolicy {
    private init() {}
    private static let calendar = Calendar(identifier: .gregorian)
    
    private static var maxCacheAgeInDays: Int {
        return 7
    }
    
    static func validate(_ timestamp: Date, against: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        return against < maxCacheAge
    }
}

