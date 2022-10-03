//
//  FeedImageCellController.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/9/30.
//

import UIKit

final class FeedImageCellController {
    private let viewModel: FeedImageViewModel<UIImage>
    
    init(viewModel: FeedImageViewModel<UIImage>) {
        self.viewModel = viewModel
    }
    
    func view() -> UITableViewCell {
        let cell = binded(FeedImageCell())
        viewModel.loadImageData()
        return cell
    }
    
    func preload() {
        viewModel.loadImageData()
    }
    
    func cancelLoad() {
        viewModel.canceImageDatalLoad()
    }
    
    private func binded(_ cell: FeedImageCell) -> FeedImageCell {
        cell.locationContainer.isHidden = !viewModel.hasLoaction
        cell.locationLabel.text = viewModel.location
        cell.descriptionLabel.text = viewModel.description
        cell.onRetry = viewModel.loadImageData
        
        viewModel.onImageLoad = { [weak cell] image in
            cell?.feedImageView.image = image
        }
        
        viewModel.onImageLoadingStateChang = { [weak cell] isLoading in
            cell?.feedImageContainer.isShimmering = isLoading
        }
        
        viewModel.onShouldRetryImageLoadingStateChang = { [weak cell] shouldRetry in
            cell?.feedImageRetryButton.isHidden = !shouldRetry
        }
        
        return cell
    }
} 
