//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/10/3.
//

import Foundation
import UIKit
import EssentialFeed

final class FeedImageViewModel {
    typealias Observer<T> = (T) -> Void
    
    private var task: FeedImageDataLoaderTask?
    private var model: FeedImage
    private var imageLoader: FeedImageDataLoader
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader) {
        self.model = model
        self.imageLoader = imageLoader
    }
    
    var description: String? {
        return model.description
    }
    
    var location: String? {
        return model.location
    }
    
    var hasLoaction: Bool {
        return location != nil
    }
    
    var onImageLoad: Observer<UIImage>?
    var onImageLoadingStateChang: Observer<Bool>?
    var onShouldRetryImageLoadingStateChang: Observer<Bool>?
    

    func loadImageData() {
        onImageLoadingStateChang?(true)
        onShouldRetryImageLoadingStateChang?(false)
                
        task = imageLoader.loadImageData(from: model.url) { [weak self] result in
            self?.handle(result)
        }
    }
    
    private func handle(_ result: FeedImageDataLoader.Result) {
        if let image = (try? result.get()).flatMap(UIImage.init) {
            onImageLoad?(image)
        } else {
            onShouldRetryImageLoadingStateChang?(true)
        }

        onImageLoadingStateChang?(false)
    }
    
    func canceImageDatalLoad() {
        task?.cancel()
        task = nil
    }
}
