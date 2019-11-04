//
//  Command.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/21/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import Foundation

protocol Command {
    func perform(arguments: [CommandArgumentKey: Any]?)
}
