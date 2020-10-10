//
//  ShoppingListCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ShoppingListCustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ShoppingListCustomCell"
    
    var name: String? {
        didSet { configure() }
    }
    
    private let listNameLabel: UILabel = {
        let label = UILabel()
        label.text = "테스트Value"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textColor = .vegeTextBlack
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        backgroundColor = .clear
        
        addSubview(listNameLabel)
        listNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure() {
        guard let name = name else { return }
        listNameLabel.text = name
    }
}
