//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/7/28.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
