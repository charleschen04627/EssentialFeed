//
//  FeedRefreshController.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/9/30.
//

import UIKit 

protocol FeedRefreshViewControllerDelegate {
    func didRequestFeedRefresh()
}

final class FeedRefreshViewController: NSObject, FeedLoadingView {
    @IBOutlet private var view: UIRefreshControl?
    
    var delegate: FeedRefreshViewControllerDelegate?
    
    @IBAction func refresh() {
        delegate? .didRequestFeedRefresh()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view?.beginRefreshing()
        } else {
            view? .endRefreshing()
        }
    }
}
