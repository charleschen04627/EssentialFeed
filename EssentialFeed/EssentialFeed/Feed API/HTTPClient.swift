//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/6/29.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needs.
    func get(from url: URL, completion: @escaping (Result) -> Void)
}
