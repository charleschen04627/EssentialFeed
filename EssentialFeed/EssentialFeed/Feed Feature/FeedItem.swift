//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/6/21.
//

import Foundation
public struct FeedItem: Equatable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
    
    public init(id: UUID, description: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
