//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/10/19.
//

public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        return location != nil
    }
}
