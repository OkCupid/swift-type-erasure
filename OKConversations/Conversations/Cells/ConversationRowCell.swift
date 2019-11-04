//
//  ConversationRowCell.swift
//  OkCupid
//
//  Created by Ariel Steinlauf on 10/28/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//

import UIKit

final class ConversationRowCell: UICollectionViewCell {
    
    @IBOutlet weak var nameAgeLabel: UILabel!
    @IBOutlet weak var messagePreviewLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileImageView: OKCircularImageView!
    @IBOutlet weak var isMessageUnreadDotView: OKOnlineIndicatorView!
    @IBOutlet weak var isUserOnlineIndicatorDotView: OKOnlineIndicatorView!
    @IBOutlet weak var repliedMessageImageView: UIImageView!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var topContentStackView: UIStackView!
    @IBOutlet weak var hairlineView: UIView!
    @IBOutlet weak var hairlineViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var isMessageUnreadDotViewSizeConstraint: NSLayoutConstraint!
    @IBOutlet weak var isUserOnlineIndicatorDotViewSizeConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImageViewSizeConstraint: NSLayoutConstraint!
    
    var onPrepareForReuse: ((ConversationRowCell) -> Void)?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        onPrepareForReuse?(self)
    }
}
