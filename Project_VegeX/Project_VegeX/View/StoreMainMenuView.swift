//
//  StoreMainMenuView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol StoreMainMenuViewDelegate: class {
    func handleBrandNew()
}

class StoreMainMenuView: UIView {
    
    // MARK: - Properties
    weak var delegate: StoreMainMenuViewDelegate?
    
    let mainCategoryView = StoreMainCategoryView()
    let mainBrandView = StoreMainBrandView()
    

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    private func configureUI() {
        setConstraints()
    }
    
    private func setConstraints() {
        [mainCategoryView, mainBrandView].forEach {
            addSubview($0)
        }
        
        mainCategoryView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        mainBrandView.delegate = self
        mainBrandView.snp.makeConstraints {
            $0.top.equalTo(mainCategoryView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }        
    }
    
}

extension StoreMainMenuView: StoreMainBrandViewDelegate {
    func handleBrandMove() {
        delegate?.handleBrandNew()
    }
}
