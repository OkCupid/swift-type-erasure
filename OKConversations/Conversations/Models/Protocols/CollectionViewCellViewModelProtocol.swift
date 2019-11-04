//
//  CollectionViewCellViewModelProtocol.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import UIKit

protocol CollectionViewCellViewModelProtocol {
    var cellType: UICollectionViewCell.Type { get }
    var size: CGSize { get }
    var commands: [CommandKey: Command] { get }
}

extension CollectionViewCellViewModelProtocol {
    var reuseIdentifier: String {
        return String(describing: cellType.self)
    }
}
