//
//  AnyHashableConversation.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

struct AnyHashableConversation: ConversationProtocol {
    
    private var conversation: ConversationProtocol

    var threadId: String {
        return conversation.threadId
    }
    
    var messagePreview: String {
        return conversation.messagePreview
    }
    
    var lastMessageDate: Date {
        return conversation.lastMessageDate
    }
    
    var correspondent: UserProtocol {
        return conversation.correspondent
    }
    
    var lastMessageSentDate: Date? {
        return conversation.lastMessageDate
    }
    
    
    var isTwoWaysPendingReply: Bool {
        return conversation.isTwoWaysPendingReply
    }

    var isUnread: Bool {
        return conversation.isUnread
    }
    
    init(_ conversation: ConversationProtocol) {
        self.conversation = conversation
    }
    
}

extension AnyHashableConversation: Hashable {}
