//
//  FeedRefreshController.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/9/30.
//

import UIKit 

final class FeedRefreshViewController: NSObject {
    private(set) lazy var view = binded(UIRefreshControl())
    
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        /// `onChange` binds the viewModel and view
        viewModel.onLoadingStateChange = { [weak view] isLoading in
            if isLoading {
                view?.beginRefreshing()
            } else {
                view?.endRefreshing()
            }
        }
        
        /// binds the view with viewModel
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return view
    }
}
