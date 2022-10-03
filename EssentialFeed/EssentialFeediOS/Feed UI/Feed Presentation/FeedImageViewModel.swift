//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by 陳明辰 on 2022/10/3.
//

import Foundation
import EssentialFeed

final class FeedImageViewModel<Image> {
    typealias Observer<T> = (T) -> Void
    
    private var task: FeedImageDataLoaderTask?
    private var model: FeedImage
    private var imageLoader: FeedImageDataLoader
    private let imageTransformer: (Data) -> Image?
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader, imageTransformer: @escaping (Data) -> Image?) {
        self.model = model
        self.imageLoader = imageLoader
        self.imageTransformer = imageTransformer
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
    
    var onImageLoad: Observer<Image>?
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
        if let image = (try? result.get()).flatMap(imageTransformer) {
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
