//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/7/28.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
