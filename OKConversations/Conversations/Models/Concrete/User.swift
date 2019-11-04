//
//  User.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

struct User: UserProtocol {    
    var displayName: String
    var age: Int
    var isOnline: Bool
    var profileImageURL: URL?
}
