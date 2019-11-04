//
//  ImageNetworkManagerProtocol.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation
import OKImageDownloader

protocol ImageNetworkManagerProtocol {
    var downloader: ImageDownloading { get }
    
    func fetchImage(request: URLRequest, completion: @escaping ImageDownloader.CompletionHandler)
    func cancelRequest(url: URL)
    func cancel(requests urls: [URL])
    func cacheImage(url: URL)
}
