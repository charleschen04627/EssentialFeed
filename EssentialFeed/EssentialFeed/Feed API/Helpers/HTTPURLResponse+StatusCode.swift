//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by 陳明辰 on 2022/10/21.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
