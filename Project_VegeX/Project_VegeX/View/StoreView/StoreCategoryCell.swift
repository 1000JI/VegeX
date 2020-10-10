//
//  StoreCategoryCell.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreCategoryCell: UICollectionViewCell {
    
    
    // MARK: - Properties
    static let identifier = "StoreCategoryCell"
    
    let title = UILabel()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func configureUI() {
        layer.borderWidth = 1
        layer.borderColor = UIColor(rgb: 0xDADCE0).cgColor
        
        title.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        
        addSubview(title)
        title.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
}
