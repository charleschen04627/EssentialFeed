//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/10/18.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
