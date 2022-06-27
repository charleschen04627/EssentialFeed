//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/6/21.
//

import Foundation
public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
