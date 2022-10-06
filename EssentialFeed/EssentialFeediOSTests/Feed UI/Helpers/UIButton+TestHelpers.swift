//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by 陳明辰 on 2022/9/30.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
