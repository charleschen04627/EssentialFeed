//
//  FeedImageCell.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/9/28.
//

import UIKit

public final class FeedImageCell: UITableViewCell {
    public let locationContainer = UIView()
    public let locationLabel = UILabel()
    public let descriptionLabel = UILabel()
    public let feedImageContainer = UIView()
    public let feedImageView = UIImageView()
    
    private(set) public lazy var feedImageRetryButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(retryButtonTap), for: .touchUpInside)
        return button
    }()
    
    var onRetry: (() -> Void)?
    
    @objc private func retryButtonTap() {
        onRetry?()
    }
}
