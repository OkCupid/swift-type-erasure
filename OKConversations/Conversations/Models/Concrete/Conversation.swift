//
//  Conversation.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

struct Conversation: ConversationProtocol {
    var threadId: String
    
    var messagePreview: String
    
    var lastMessageDate: Date
    
    var correspondent: UserProtocol
    
    var isUnread: Bool
    
    var lastMessageSentDate: Date?
        
    var isTwoWaysPendingReply: Bool
    
    func isEqualTo(_ other: ConversationProtocol) -> Bool {
        return threadId == other.threadId
    }
}

extension Conversation {
    static func create(threadId: String,
                       user: UserProtocol,
                       messagePreview: String) -> ConversationProtocol {
        Conversation(threadId: threadId,
                     messagePreview: messagePreview,
                     lastMessageDate: .randomTimeToday(),
                     correspondent: user,
                     isUnread: arc4random_uniform(4) == 0,
                     lastMessageSentDate: Date(),
                     isTwoWaysPendingReply: arc4random_uniform(2) == 0)
    }
}
