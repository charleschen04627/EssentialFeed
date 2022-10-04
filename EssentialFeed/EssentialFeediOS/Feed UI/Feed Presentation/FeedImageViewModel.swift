//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/10/3.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
