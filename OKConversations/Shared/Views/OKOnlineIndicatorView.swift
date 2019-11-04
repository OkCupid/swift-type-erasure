//
//  OKOnlineIndicatorView.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/17/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//
import UIKit

@IBDesignable
final class OKOnlineIndicatorView: UIView {
    
    @IBInspectable var dotColor: UIColor = .init(red:0.02, green:0.56, blue:0.35, alpha:1.0) {
        didSet {
            backgroundColor = dotColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = dotColor
    }
}
