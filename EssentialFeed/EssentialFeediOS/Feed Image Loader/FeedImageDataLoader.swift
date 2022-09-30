//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/9/30.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
