//
//  ConversationsNetworkClient.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/25/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

final class ConversationsNetworkClient {
    
    private let dummyConversationsGenerator: DummyConversations = .init()
    
    func fetchConversations(completion: @escaping (Result<[ConversationProtocol], Error>) -> Void) {
        let result: Result<[ConversationProtocol], Error> = .success(dummyConversationsGenerator.generateDummyData())
        
        // Delay to pretend this is a network request 😛
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(result)
        }
    }
}
