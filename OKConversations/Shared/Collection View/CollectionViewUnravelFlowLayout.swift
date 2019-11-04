//
//  CollectionViewUnravelFlowLayout.swift
//  OKConversations
//
//  Created by Jordan Guggenheim on 11/4/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import UIKit

final class CollectionViewUnravelFlowLayout: UICollectionViewFlowLayout {
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard
            let collectionView = collectionView,
            let layoutAttributes = collectionView.layoutAttributesForItem(at: itemIndexPath)?.copy() as? UICollectionViewLayoutAttributes
            else {
                return super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        }
        
        let isFirstItem = itemIndexPath.item == 0
        let cellHeight = layoutAttributes.frame.height
        
        layoutAttributes.frame.origin.y -= isFirstItem ? cellHeight / 2 : cellHeight
        layoutAttributes.alpha = 0.5
        layoutAttributes.zIndex = itemIndexPath.item * -10
        
        return layoutAttributes
    }
}
