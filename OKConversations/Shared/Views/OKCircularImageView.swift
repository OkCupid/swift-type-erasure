//
//  OKCircularImageView.swift
//  OKConversations
//
//  Created by Ariel Steinlauf on 10/17/19.
//  Copyright © 2019 Ariel Steinlauf. All rights reserved.
//
import UIKit

final class OKCircularImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }
}
