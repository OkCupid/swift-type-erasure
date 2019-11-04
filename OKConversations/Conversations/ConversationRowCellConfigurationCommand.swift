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
    private let imageNetworkManager: OKImageNetworkManagerProtocol
    
    // MARK: - Lifecycle

    init(conversation: ConversationProtocol, imageNetworkManager: OKImageNetworkManagerProtocol) {
        self.conversation = conversation
        self.imageNetworkManager = imageNetworkManager
    }
    
    // MARK: - Command
    
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
    
    // MARK: - Private

    private func onPrepareForReuse(cell: ConversationRowCell) {
        cell.profileImageView.image = nil
    }
    
    private func configureImageView(cell: ConversationRowCell) {
        cell.profileImageView.backgroundColor = .gray5
        cell.profileImageViewSizeConstraint.constant = 72
        if let urlRequest = conversation.profileImageURLRequest {
            imageNetworkManager.fetchImage(request: urlRequest) { (response, _) in
                switch response {
                case .success(let image):
                    cell.profileImageView.image = image
                case .failure(_):
                    break
                }
            }
        }
    }
    
    private func configureLabels(cell: ConversationRowCell) {
        let correspondent = conversation.correspondent
        
        // Message Preview Label
        cell.messagePreviewLabel.font = .okcupidFont(ofSize: 16, weight: .regular)
        cell.messagePreviewLabel.text = conversation.messagePreview.text
        
        if conversation.messagePreview.isFromMe {
            cell.messagePreviewLabel.textColor = .gray12
        } else {
            cell.messagePreviewLabel.textColor = .black
        }
        
        // Name Age Label
        cell.nameAgeLabel.font = .okcupidFont(ofSize: 18, weight: .medium)
        cell.nameAgeLabel.text = "\(correspondent.displayName), \(correspondent.age)"
        cell.nameAgeLabel.textColor = .black

        // Time Label
        cell.timeLabel.font = .okcupidFont(ofSize: 14, weight: .regular)
        cell.timeLabel.text = conversation.lastMessageDate.relativeTimeSpanString()
        cell.timeLabel.textColor = .gray12
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
        cell.hairlineView.backgroundColor = .gray13
    }
}
