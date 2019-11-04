//
//  ConversationsDataSource.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import UIKit

final class ConversationsDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let imageNetworkManager: ImageNetworkManagerProtocol
    private weak var collectionView: UICollectionView?
    private var viewModels: [CollectionViewCellViewModelProtocol] = []
    
    init(imageNetworkManager: ImageNetworkManagerProtocol = ImageNetworkManager.shared,
         collectionView: UICollectionView) {
        self.imageNetworkManager = imageNetworkManager
        self.collectionView = collectionView
    }
    
    func updateCollectionView(conversations: [ConversationProtocol]) {
        guard let collectionView = collectionView else { return }
        
        let viewModelContext = ConversationsViewModelContext(width: collectionView.bounds.width)
        
        DispatchQueue.global(qos: .userInteractive).async {
            let viewModels = conversations.map {
                return ConversationRowCellViewModelFactory(conversation: $0,
                                                           viewModelContext: viewModelContext,
                                                           imageNetworkManager: self.imageNetworkManager).create()
            }
            
            for (index, viewModel) in viewModels.enumerated() {
                let initialDelay: TimeInterval = 0.15
                let incrementalDelay: TimeInterval = 0.1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + initialDelay + (incrementalDelay * TimeInterval(index))) {
                    self.viewModels.append(viewModel)
                    self.collectionView?.insertItems(at: [IndexPath(item: self.viewModels.count - 1, section: 0)])
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseIdentifier, for: indexPath)
        viewModel.commands[.configuration]?.perform(arguments: [.cell: cell])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModels[indexPath.row].size
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModels[indexPath.row].commands[.cancellation]?.perform(arguments: nil)
    }
}
