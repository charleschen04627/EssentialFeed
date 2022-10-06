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
        let presenterAdapter = FeedLoaderPresentationAdapter(feedLoader: MainQueueDispatchDecorator(decoratee: feedLoader))

        let feedViewController = makeFeedViewController(
            delegate: presenterAdapter,
            title: FeedPresenter.title)
        
        presenterAdapter.presenter = FeedPresenter(
            feedView: FeedViewAdapter(
                controller: feedViewController,
                imageLoader: MainQueueDispatchDecorator(decoratee: imageLoader)),
            loadingView: WeakRefVirtualProxy(feedViewController))

        return feedViewController
    }
    
    private static func makeFeedViewController(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.delegate = delegate
        feedController.title = title
        return feedController
    }
}

