//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by 陳明辰 on 2022/9/30.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
