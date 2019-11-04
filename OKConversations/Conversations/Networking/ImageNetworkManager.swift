//
//  ImageNetworkManager.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation
import OKImageDownloader

final class ImageNetworkManager: ImageNetworkManagerProtocol {
    
    static let shared = ImageNetworkManager()
    
    var downloader: ImageDownloading

    init(downloader: ImageDownloading = ImageDownloader.shared) {
        self.downloader = downloader
    }
    
    func fetchImage(request: URLRequest, completion: @escaping ImageDownloader.CompletionHandler) {
        guard let url = request.url else { return }
        downloader.download(url: url, receiptHandler: nil, completionHandler: completion)
    }
    
    func cancelRequest(url: URL) {
        downloader.cancel(url: url, receipt: nil)
    }
    
    func cancel(requests urls: [URL]) {
        urls.forEach { self.downloader.cancel(url: $0, receipt: nil) }
    }
    
    func cacheImage(url: URL) {
        
    }
}
