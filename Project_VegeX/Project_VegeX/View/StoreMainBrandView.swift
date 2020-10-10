//
//  StoreMainBrandView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol StoreMainBrandViewDelegate: class {
    func handleBrandMove()
}

class StoreMainBrandView: UIView {
    
    // MARK: - Properties
    var delegate: StoreMainBrandViewDelegate?
    
    let dataBrain = DataBrain()
    var brands = [String]()
    let categoryLabel = UILabel()
    
    let firstLineStackView = UIStackView()
    let secondLineStackView = UIStackView()
    let thirdLineStackView = UIStackView()
    lazy var stackViews = [firstLineStackView, secondLineStackView, thirdLineStackView]
    
    let brandStackView = UIStackView()
    
    
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
        generateBrands()
        setPropertyAttributes()
        setStackViews()
        setConstraints()
    }
    
    private func setPropertyAttributes() {
        categoryLabel.text = "뷰티"
        categoryLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 16)
        categoryLabel.textColor = .vegeTextBlack
    }
    
    private func setStackViews() {
        stackViews.forEach {
            $0.alignment = .center
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 10
            brandStackView.addArrangedSubview($0)
        }
        brandStackView.backgroundColor = .green
        brandStackView.alignment = .center
        brandStackView.axis = .vertical
        brandStackView.distribution = .fillEqually
        brandStackView.spacing = 5
    }
    
    private func setConstraints() {
        [categoryLabel, brandStackView].forEach {
            addSubview($0)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(34)
            $0.leading.equalTo(20)
        }
        brandStackView.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
        stackViews.forEach {
            $0.snp.makeConstraints {
                $0.leading.trailing.equalTo(categoryLabel)
            }
        }
    }
    
    
    // MARK: - Helpers
    private func generateBrands() {
        for brand in dataBrain.storeMainBrandData {
            brands.append(brand["title"]!)
        }
        var objectCounter = 0
        var stackViewCounter = 0
        for index in brands.indices {
            let brandObject = StoreMainBrandObjectView()
            brandObject.brandTitle.text = brands[index]
            brandObject.imageView.image = UIImage(named: dataBrain.storeMainBrandData[index]["image"]!)
        
            stackViews[stackViewCounter].addArrangedSubview(brandObject)
            objectCounter += 1
            if objectCounter == 4 {
                stackViewCounter += 1
                objectCounter = 0
            }
            
            brandObject.snp.makeConstraints {
                $0.height.equalTo(100)
            }
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMoveBrand))
            brandObject.addGestureRecognizer(tapGesture)
            brandObject.isUserInteractionEnabled = true
        }
    }
    
    // MARK: - Selectors
    
    @objc func handleMoveBrand() {
        delegate?.handleBrandMove()
    }
}
