//
//  MockData.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

struct DummyConversations {
    
    private let ariel: UserProtocol = User(displayName: "Ariel",
                                           age: 23,
                                           isOnline: true,
                                           profileImageURL: URL(string: "https://cdn.okccdn.com/media/img/hub/staff-output/ariel_steinlauf.jpg"))
    
    private let arielCEO: UserProtocol = User(displayName: "Ariel",
                                              age: 32,
                                              isOnline: true,
                                              profileImageURL: URL(string: "https://cdn.okccdn.com/media/img/hub/staff-output/ariel_charytan.jpg"))
    
    
    private let joel: UserProtocol = User(displayName: "Joel",
                                          age: 27,
                                          isOnline: false,
                                          profileImageURL: URL(string: "https://cdn.okccdn.com/media/img/hub/staff-output/joel_bell.jpg"))
    
    private let jordan: UserProtocol = User(displayName: "Jordan",
                                            age: 29,
                                            isOnline: true,
                                            profileImageURL: URL(string: "https://cdn.okccdn.com/media/img/hub/staff-output/jordan_guggenheim.jpg"))
    
    private let christian: UserProtocol = User(displayName: "Christian",
                                               age: 44,
                                               isOnline: true,
                                               profileImageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/74/Christian-rudder-headshot.jpg"))
    
    private let elie: UserProtocol = User(displayName: "Elie",
                                           age: 43,
                                           isOnline: true,
                                           profileImageURL: URL(string:"https://pbs.twimg.com/profile_images/930803827489386496/f25P0peE.jpg"))
    
    func generateDummyData() -> [ConversationProtocol] {
        [
            Conversation.create(threadId: "1",
                                user: ariel,
                                messagePreview: "I ❤️ swift protocols"),
            Conversation.create(threadId: "2",
                                user: arielCEO,
                                messagePreview: "Protocol extensions are neat!"),
            Conversation.create(threadId: "3",
                                user: jordan,
                                messagePreview: "The command pattern is amazing!"),
            Conversation.create(threadId: "4",
                                user: joel,
                                messagePreview: "Excited for wwdc!"),
            Conversation.create(threadId: "5",
                                user: christian,
                                messagePreview: "Swift is awesome"),
            Conversation.create(threadId: "6",
                                user: elie,
                                messagePreview: "I ❤️ OkCupid")
        ]
    }
}
