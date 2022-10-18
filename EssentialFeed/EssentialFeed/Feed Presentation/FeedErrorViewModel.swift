//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/10/18.
//

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}

