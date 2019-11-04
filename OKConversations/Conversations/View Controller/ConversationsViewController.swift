//
//  ConversationsViewController.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import UIKit

final class ConversationsViewController: UICollectionViewController {
    
    private let apiClient: ConversationsNetworkClient = .init()
    private var conversations: Set<AnyHashableConversation> = .init()
    
    private lazy var conversationsDataSource: ConversationsDataSource = {
        return ConversationsDataSource(collectionView: collectionView)
    }()
    
    convenience init() {
        self.init(collectionViewLayout: CollectionViewUnravelFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Conversations"
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchConversations()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = conversationsDataSource
        
        let nib = UINib(nibName: String(describing: ConversationRowCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: String(describing: ConversationRowCell.self))
        collectionView.dataSource = conversationsDataSource
        collectionView.delegate = conversationsDataSource
        collectionView.alwaysBounceVertical = true
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
        }
        
        collectionView.backgroundColor = .gray1
    }
    
    private func fetchConversations() {
        apiClient.fetchConversations() { [weak self] result in
            if case let .success(conversations) = result, let self = self {
                let hashableConvos = conversations.compactMap(AnyHashableConversation.init)
                hashableConvos.forEach { self.conversations.update(with: $0) }
                
                let sortedConversations = Array(hashableConvos).sorted {  $0.lastMessageDate.compare($1.lastMessageDate) == .orderedDescending }
                
                self.conversationsDataSource.updateCollectionView(conversations: sortedConversations)
            }
        }
    }
    
}
