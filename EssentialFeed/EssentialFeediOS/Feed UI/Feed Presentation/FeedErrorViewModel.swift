//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/10/18.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
