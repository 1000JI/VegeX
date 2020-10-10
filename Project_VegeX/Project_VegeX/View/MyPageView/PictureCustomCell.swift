//
//  PictureCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class PictureCustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "PictureCustomCell"
    
    private let plusCircleImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "plus_circle"))
        iv.snp.makeConstraints {
            $0.height.width.equalTo(16)
        }
        return iv
    }()
    
    private let pictureLabel: UILabel = {
        let label = UILabel()
        label.text = "사진"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 11)
        label.textAlignment = .center
        label.textColor = UIColor(rgb: 0x808991)
        return label
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
    
    func configureUI() {
        makedottedLine()
        
        let stack = UIStackView(arrangedSubviews: [plusCircleImageView, pictureLabel])
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .center
        
        addSubview(stack)
        stack.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func makedottedLine() {
        layer.sublayers?.removeAll()
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.vegeAmountBorderColor.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [5, 5]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width, y: 0)])
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: 0, y: self.frame.height)])
        path.addLines(between: [CGPoint(x: 0, y: self.frame.height),
                                CGPoint(x: self.frame.width, y: self.frame.height)])
        path.addLines(between: [CGPoint(x: self.frame.width, y: 0),
                                CGPoint(x: self.frame.width, y: self.frame.height)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
