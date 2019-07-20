//
//  StackTableView.swift
//  SettingsBundle
//
//  Created by macbook on 7/18/19.
//  Copyright © 2019 jaminya. All rights reserved.
//

import UIKit

class StackTableView: UITableView {

    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
