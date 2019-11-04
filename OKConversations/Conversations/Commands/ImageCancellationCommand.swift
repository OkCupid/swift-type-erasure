//
//  ImageCancellationCommand.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 11/3/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

struct ImageCancellationCommand: Command {
    
    private let imageNetworkManager: ImageNetworkManagerProtocol
    private let url: URL?
    
    init(url: URL?,
         imageNetworkManager: ImageNetworkManagerProtocol = ImageNetworkManager.shared) {
        self.url = url
        self.imageNetworkManager = imageNetworkManager
    }
    
    func perform(arguments: [CommandArgumentKey : Any]?) {
        guard let url = url else { return }
        
        imageNetworkManager.cancelRequest(url: url)
    }
}
