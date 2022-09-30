//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/9/30.
//

import UIKit
import EssentialFeed

public final class FeedUIComposer {
    private init() {}
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController{
        let refreshController = FeedRefreshViewController(loader: feedLoader)
        let feedViewController = FeedViewController(refreshController: refreshController)
        refreshController.onRefresh = { [weak feedViewController] feed in
            feedViewController?.tableModel = feed.map { model in
                FeedImageCellController(model: model, imageLoader: imageLoader)
            }
        }
        return feedViewController
    }
}
