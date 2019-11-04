//
//  ConversationProtocol+Hashable.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/29/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

extension ConversationProtocol where Self: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(threadId)
    }

    func isEqualTo(_ other: ConversationProtocol) -> Bool {
        guard let otherConversation = other as? Self else {
            return false
        }
        
        return threadId == otherConversation.threadId
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.isEqualTo(rhs)
    }
}
