//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by 陳明辰 on 2022/9/30.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
