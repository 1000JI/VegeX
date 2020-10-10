//
//  ShoppingStatusCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ShoppingStatusCustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ShoppingStatusCustomCell"
    
    var shoppingType: ShoppingHelpType? {
        didSet { configure() }
    }
    
    private var count1Label: UILabel!
    private var count2Label: UILabel!
    private var count3Label: UILabel!
    private var count4Label: UILabel!
    lazy var countLabelArray = [count1Label, count2Label, count3Label, count4Label]
    
    private var name1Label: UILabel!
    private var name2Label: UILabel!
    private var name3Label: UILabel!
    private var name4Label: UILabel!
    lazy var nameLabelArray = [name1Label, name2Label, name3Label, name4Label]
    
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
        
        let stackArray = UIStackView()
        stackArray.axis = .horizontal
        for index in countLabelArray.indices {
            countLabelArray[index] = makeCountLabel()
            nameLabelArray[index] = makeNameLabel()
            stackArray.addArrangedSubview(makeStackView(topLabel: countLabelArray[index]!, bottomLabel: nameLabelArray[index]!))
            
            if index == countLabelArray.count - 1 {
                countLabelArray[index]?.textColor = .vegeTextBlack
            }
        }
        addSubview(stackArray)
        stackArray.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func makeStackView(topLabel: UILabel, bottomLabel: UILabel) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [topLabel, bottomLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        stack.snp.makeConstraints {
            $0.width.equalTo(80)
        }
        return stack
    }
    
    func makeCountLabel() -> UILabel {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor(rgb: 0xAAAAAA)
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        return label
    }
    
    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.text = "테스트"
        label.textColor = .vegeTextBlack
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 11)
        return label
    }
    
    func configure() {
        guard let shoppingType = shoppingType else { return }
            
        for index in nameLabelArray.indices {
            if shoppingType == .order {
                nameLabelArray[index]?.text = ShoppingCategoryData.orderCategory[index]
            } else {
                nameLabelArray[index]?.text = ShoppingCategoryData.cancelCategory[index]
            }
        }
    }
}
