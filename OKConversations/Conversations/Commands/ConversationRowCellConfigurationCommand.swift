//
//  ConversationRowCellConfigurationCommand.swift
//  OkCupid
//
//  Created by Ariel Steinlauf on 7/19/19.
//  Copyright © 2019 OkCupid. All rights reserved.
//

import Foundation

struct ConversationRowCellConfigurationCommand: Command {
    
    private let conversation: ConversationProtocol
    private let imageNetworkManager: ImageNetworkManagerProtocol
    private let dateFormatter: DateFormatter
    
    init(conversation: ConversationProtocol,
         dateFormatter: DateFormatter,
         imageNetworkManager: ImageNetworkManagerProtocol) {
        self.conversation = conversation
        self.dateFormatter = dateFormatter
        self.imageNetworkManager = imageNetworkManager
    }
        
    func perform(arguments: [CommandArgumentKey : Any]?) {
        guard let cell = arguments?[.cell] as? ConversationRowCell else {
            return
        }
        
        cell.onPrepareForReuse = onPrepareForReuse
        cell.contentView.backgroundColor = .white
        configureImageView(cell: cell)
        configureLabels(cell: cell)
        configureAccessoryViewsVisibilty(cell: cell)
        configureDotSizeConstraints(cell: cell)
        configureHairline(cell: cell)
    }
        
    private func onPrepareForReuse(cell: ConversationRowCell) {
        cell.profileImageView.image = nil
    }
    
    private func configureImageView(cell: ConversationRowCell) {
        cell.profileImageView.backgroundColor = .white
        cell.profileImageViewSizeConstraint.constant = 72
        
        guard let url = conversation.correspondent.profileImageURL else {
            return
        }
    
        let urlRequest = URLRequest(url: url)
        imageNetworkManager.fetchImage(request: urlRequest) { (response, _) in
            switch response {
            case .success(let image):
                cell.profileImageView.image = image
                
            case .failure:
                break
            }
        }
    }
    
    private func configureLabels(cell: ConversationRowCell) {
        let correspondent = conversation.correspondent
        cell.messagePreviewLabel.text = conversation.messagePreview
        
        cell.nameAgeLabel.text = "\(correspondent.displayName), \(correspondent.age)"
        cell.nameAgeLabel.textColor = .black
        
        dateFormatter.dateFormat = "h:mm a"
        cell.timeLabel.text = dateFormatter.string(from: conversation.lastMessageDate)
        cell.timeLabel.textColor = .gray
    }
    
    private func configureAccessoryViewsVisibilty(cell: ConversationRowCell) {
        cell.isUserOnlineIndicatorDotView.isHidden = !conversation.correspondent.isOnline
        
        if conversation.isUnread {
            cell.isMessageUnreadDotView.isHidden = false
            cell.repliedMessageImageView.isHidden = true
            
        } else if conversation.isTwoWaysPendingReply {
            cell.repliedMessageImageView.isHidden = false
            cell.isMessageUnreadDotView.isHidden = true
            
        } else {
            cell.isMessageUnreadDotView.isHidden = true
            cell.repliedMessageImageView.isHidden = true
        }
    }
    
    private func configureDotSizeConstraints(cell: ConversationRowCell) {
        cell.isUserOnlineIndicatorDotViewSizeConstraint.constant = 8
        cell.isMessageUnreadDotViewSizeConstraint.constant = 10
    }
    
    private func configureHairline(cell: ConversationRowCell) {
        cell.hairlineViewHeightConstraint.constant = 1
        cell.hairlineView.backgroundColor = .gray2
    }
}
