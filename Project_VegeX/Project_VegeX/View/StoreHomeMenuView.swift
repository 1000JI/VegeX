//
//  StoreHomeMenuView.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/17/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol StoreHomeMenuViewDelegate: class {
    func handleDidSelect()
}

class StoreHomeMenuView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: StoreHomeMenuViewDelegate?
    
    let dataBrain = DataBrain()
    
    private let categoryCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let productCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    var isActivated: Bool = true {
        didSet {
            isHidden.toggle()
        }
    }
    
    
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
        setPropertyAttributes()
        setConstraints()
    }
    
    private func setPropertyAttributes() {
        categoryCollectionView.register(StoreCategoryCell.self, forCellWithReuseIdentifier: StoreCategoryCell.identifier)
        productCollectionView.register(StoreProductCell.self, forCellWithReuseIdentifier: StoreProductCell.identifier)
        [categoryCollectionView, productCollectionView].forEach {
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setConstraints() {
        [categoryCollectionView, productCollectionView].forEach {
            addSubview($0)
        }
        
        categoryCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        productCollectionView.snp.makeConstraints {
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


// MARK: - UICollectionViewDataSource
extension StoreHomeMenuView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return dataBrain.storeHomeCategoryData.count
        case productCollectionView:
            return dataBrain.storeHomeProductData.count
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: StoreCategoryCell.identifier, for: indexPath) as? StoreCategoryCell else { fatalError() }
            cell.title.text = dataBrain.storeHomeCategoryData[indexPath.item]
            if indexPath.item == 0 {
                let color: UIColor = .vegeGreen
                cell.layer.borderColor = color.cgColor
                cell.layer.borderWidth = 1.5
                cell.title.textColor = .vegeGreen
                cell.title.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 12)
            }
            return cell
        case productCollectionView:
            guard let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: StoreProductCell.identifier, for: indexPath) as? StoreProductCell else { fatalError() }
            let mainImage = UIImage(named: dataBrain.storeHomeProductData[indexPath.item]["main_image"]!)!
            let mainTitle = dataBrain.storeHomeProductData[indexPath.item]["title"]!
            let mainDescription = dataBrain.storeHomeProductData[indexPath.item]["description"]!
            
            let product1Image = UIImage(named: dataBrain.storeHomeProductData[indexPath.item]["product_image_1"]!)!
            let product1Title = dataBrain.storeHomeProductData[indexPath.item]["product_title_1"]!
            let product1Description = dataBrain.storeHomeProductData[indexPath.item]["product_description_1"]!
            let product1Price = dataBrain.storeHomeProductData[indexPath.item]["product_price_1"]!
            
            let product2Image = UIImage(named: dataBrain.storeHomeProductData[indexPath.item]["product_image_2"]!)!
            let product2Title = dataBrain.storeHomeProductData[indexPath.item]["product_title_2"]!
            let product2Description = dataBrain.storeHomeProductData[indexPath.item]["product_description_2"]!
            let product2Price = dataBrain.storeHomeProductData[indexPath.item]["product_price_2"]!
            
            cell.configureCell(
                mainImage: mainImage, mainTitle: mainTitle, mainDescription: mainDescription,
                product1Image: product1Image, product1Title: product1Title, product1Description: product1Description, product1Price: product1Price,
                product2Image: product2Image, product2Title: product2Title, product2Description: product2Description, product2Price: product2Price)
            return cell
        default:
            fatalError()
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension StoreHomeMenuView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoryCollectionView:
            let width = categoryCollectionView.frame.width / 3.5
            let height = categoryCollectionView.frame.height
            return CGSize(width: width, height: height)
        case productCollectionView:
            let width = productCollectionView.frame.width - 40
            let height = productCollectionView.frame.height * 1.5
            return CGSize(width: width, height: height)
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case categoryCollectionView:
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        case productCollectionView:
            return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case categoryCollectionView:
            return 8
        case productCollectionView:
            return 8
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case categoryCollectionView:
            return 8
        case productCollectionView:
            return 8
        default:
            fatalError()
        }
    }
}


// MARK: - UICollectionViewDelegate
extension StoreHomeMenuView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryCollectionView:
            guard let cell = collectionView.cellForItem(at: indexPath) as? StoreCategoryCell else { return }
            if indexPath.item != 0 {
                let firstIndexPath: IndexPath = [0, 0]
                let color: UIColor = UIColor(rgb: 0xDADCE0)
                guard let firstCell = collectionView.cellForItem(at: firstIndexPath) as? StoreCategoryCell else { return }
                firstCell.layer.borderColor = color.cgColor
                firstCell.layer.borderWidth = 1.5
                firstCell.title.textColor = .vegeTextBlack
                firstCell.title.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
            }
            let color: UIColor = .vegeGreen
            cell.layer.borderColor = color.cgColor
            cell.layer.borderWidth = 1.5
            cell.title.textColor = .vegeGreen
            cell.title.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 12)
        case productCollectionView:
            delegate?.handleDidSelect()
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryCollectionView:
            let color: UIColor = UIColor(rgb: 0xDADCE0)
            guard let cell = collectionView.cellForItem(at: indexPath) as? StoreCategoryCell else { return }
            cell.layer.borderColor = color.cgColor
            cell.layer.borderWidth = 1.5
            cell.title.textColor = .vegeTextBlack
            cell.title.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        case productCollectionView:
            break
        default:
            break
        }
    }
}
