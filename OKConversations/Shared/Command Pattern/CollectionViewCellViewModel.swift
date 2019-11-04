//
//  CollectionViewCellViewModel.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/29/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import UIKit

struct CollectionViewCellViewModel: CollectionViewCellViewModelProtocol {
    let cellType: UICollectionViewCell.Type
    let size: CGSize
    let commands: [CommandKey: Command]
}
