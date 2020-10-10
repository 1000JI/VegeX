//
//  TutorialCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/15.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class TutorialCustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "TutorialCustomCell"
    
    var tutorial: Tutorial? {
        didSet { configure() }
    }
    
    private let tutorialImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "tutorialimage"))
        iv.contentMode = .scaleAspectFill
        
        let alphaView = UIView()
        alphaView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        iv.addSubview(alphaView)
        alphaView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "0일차"
        label.textColor = .white
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sub Title Added."
        label.textColor = .white
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        return label
    }()
    
    private let checkImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "circle"))
        iv.snp.makeConstraints {
            $0.height.width.equalTo(42)
        }
        return iv
    }()
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
//        guard let tutorial = tutorial else { return }
//        titleLabel.text = tutorial.title
//        subTitleLabel.text = tutorial.subTitle
//        tutorialImageView.image = UIImage(named: tutorial.imageName)
        
//        checkImageView.image = tutorial.isFinish ?
//            UIImage(named: "checkcircle") : UIImage(named: "circle")
    }
    
    func configureUI() {
        clipsToBounds = true
        
        addSubview(tutorialImageView)
        tutorialImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 0
        
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-12)
        }
        
        addSubview(checkImageView)
        checkImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
}
