//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/10/5.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
