//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/6/29.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
