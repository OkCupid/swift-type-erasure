//
//  ConversationRowCellViewModelFactory.swift
//  OkCupid
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import UIKit

struct ConversationRowCellViewModelFactory {
    
    private let conversation: ConversationProtocol
    private let viewModelContext: ConversationsViewModelContext
    private let imageNetworkManager: ImageNetworkManagerProtocol
    private let dateFormatter: DateFormatter
    
    init(conversation: ConversationProtocol,
         viewModelContext: ConversationsViewModelContext,
         dateFormatter: DateFormatter = DateFormatter(),
         imageNetworkManager: ImageNetworkManagerProtocol = ImageNetworkManager.shared) {
        self.conversation = conversation
        self.viewModelContext = viewModelContext
        self.dateFormatter = dateFormatter
        self.imageNetworkManager = imageNetworkManager        
    }
    
    func create() -> CollectionViewCellViewModelProtocol {
        let configurationCommand = ConversationRowCellConfigurationCommand(conversation: conversation,
                                                                           dateFormatter: dateFormatter,
                                                                           imageNetworkManager: imageNetworkManager)
        let commands: [CommandKey: Command] = [
            .configuration: configurationCommand,
            .cancellation: ImageCancellationCommand(url: conversation.correspondent.profileImageURL,
                                                    imageNetworkManager: imageNetworkManager)
        ]
        
        let cellSize = CGSize(width: viewModelContext.width,
                              height: viewModelContext.conversationRowHeight)
        
        return CollectionViewCellViewModel(cellType: ConversationRowCell.self,
                                           size: cellSize,
                                           commands: commands)
    }
}
