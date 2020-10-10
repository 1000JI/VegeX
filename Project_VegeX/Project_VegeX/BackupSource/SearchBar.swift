//
//  SearchBar.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/16/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class SearchBar : UISearchBar {

    var preferredFont:UIFont?
    var preferredTextColor:UIColor?

    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)

        self.frame = frame
        self.preferredFont = font
        self.preferredTextColor = textColor
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}

