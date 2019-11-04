//
//  UserProtocol.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

protocol UserProtocol {
    var displayName: String { get }
    var age: Int { get }
    var isOnline: Bool { get }
    
    var profileImageURL: URL? { get }
}
