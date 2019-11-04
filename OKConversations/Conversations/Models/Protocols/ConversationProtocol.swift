//
//  ConversationProtocol.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

protocol ConversationProtocol {
    var threadId: String { get }
    var messagePreview: String { get }
    var lastMessageDate: Date { get }
    var correspondent: UserProtocol { get }
    var isUnread: Bool { get }
    var lastMessageSentDate: Date? { get  }

    var isTwoWaysPendingReply: Bool { get }
    
    func isEqualTo(_ other: ConversationProtocol) -> Bool
}
