//
//  StoreViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    // MARK: - Properties
    
    private let storeDetailScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .vegeGrayBackground
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    private let basketView = BasketView()
    
    private let detailImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "deardahlia"))
        iv.contentMode = .scaleAspectFill
        
        let alphaView = UIView()
        alphaView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        iv.addSubview(alphaView)
        alphaView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        return iv
    }()
    
    private let heartImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "heart")?.withRenderingMode(.alwaysTemplate))
        iv.tintColor = .white
        iv.snp.makeConstraints {
            $0.width.height.equalTo(22)
        }
        return iv
    }()
    
    private let heartLabel: UILabel = {
        let label = UILabel()
        label.text = "771"
        label.textColor = .white
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var topDetailView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        
        view.addSubview(detailImageView)
        detailImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let heartStack = UIStackView(arrangedSubviews: [heartImageView, heartLabel])
        heartStack.axis = .vertical
        heartStack.spacing = 0
        heartStack.distribution = .fillProportionally
        
        view.addSubview(heartStack)
        heartStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        return view
    }()
    
    private let englishNameLabel: UILabel = {
        let label = UILabel()
        label.text = "DEAR DAHLIA"
        label.textColor = .white
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let koreanNameLabel: UILabel = {
        let label = UILabel()
        label.text = "디어달리아"
        label.textColor = .white
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 30)
        label.textAlignment = .left
        return label
    }()
    
    private let detailContentsLabel: UILabel = {
        let label = UILabel()
        label.text = "디어달리아는 Tineless Beauty를 추구하는 럭셔리 비건 뷰티 브랜드입니다."
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    private let detailLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    private lazy var detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: detailLayout)
    
    
    private let verticalPadding: CGFloat = 12
    private let sidePadding: CGFloat = 20
    private let productSpacingPadding: CGFloat = 16
    private let productLinePadding: CGFloat = 20
    private let productCellHeight: CGFloat = 304
    
    private let productLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    private lazy var productCollectionView = UICollectionView(frame: .zero, collectionViewLayout: productLayout)
    
    
    private let detailFilterButton = FilterSelectorView()
    private let kindOfFilterButton = FilterSelectorView()
    
    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.vegeGreen, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        button.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        button.layer.borderColor = UIColor.vegeGreen.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 52 / 2
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let attributes = productCollectionView.layoutAttributesForItem(at: IndexPath(item: 5, section: 0))
        productCollectionView.snp.updateConstraints {
            $0.height.equalTo((attributes?.frame.maxY)!)
        }
        view.layoutIfNeeded()
        
        storeDetailScrollView.contentSize = CGSize(width: view.frame.width, height: moreButton.frame.maxY + 116)
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureCollectionView() {
        detailCollectionView.backgroundColor = .clear
        detailCollectionView.showsHorizontalScrollIndicator = false
        detailCollectionView.decelerationRate = .fast
//        collectionView.isPagingEnabled = true
        detailCollectionView.dataSource = self
        detailCollectionView.delegate = self
        detailCollectionView.register(DetailCustomCell.self,
                                forCellWithReuseIdentifier: DetailCustomCell.identifier)
        
        productCollectionView.backgroundColor = .clear
        productCollectionView.isScrollEnabled = false
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.register(ProductCustomCell.self, forCellWithReuseIdentifier: ProductCustomCell.identifer)
    }
    
    func configureUI() {
        view.addSubview(storeDetailScrollView)
        storeDetailScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        storeDetailScrollView.addSubview(topDetailView)
        topDetailView.snp.makeConstraints {
            $0.top.leading.trailing.width.equalToSuperview()
            $0.height.equalTo(368)
        }
        
        let infoLabelStack = UIStackView(arrangedSubviews: [englishNameLabel,
                                                            koreanNameLabel,
                                                            detailContentsLabel])
        infoLabelStack.axis = .vertical
        infoLabelStack.spacing = 4
        infoLabelStack.distribution = .fillProportionally
        
        storeDetailScrollView.addSubview(infoLabelStack)
        infoLabelStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview().offset(40)
            $0.width.equalTo(200)
        }
        
        storeDetailScrollView.addSubview(detailCollectionView)
        detailCollectionView.snp.makeConstraints {
            $0.top.equalTo(infoLabelStack.snp.bottom).offset(32)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(126)
        }
        
        let filterButtonStack = UIStackView(arrangedSubviews: [detailFilterButton, kindOfFilterButton])
        filterButtonStack.axis = .horizontal
        filterButtonStack.spacing = 0
        filterButtonStack.distribution = .fillEqually
        
        storeDetailScrollView.addSubview(filterButtonStack)
        filterButtonStack.snp.makeConstraints {
            $0.top.equalTo(topDetailView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        storeDetailScrollView.addSubview(productCollectionView)
        productCollectionView.snp.makeConstraints {
            $0.top.equalTo(filterButtonStack.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        storeDetailScrollView.addSubview(moreButton)
        moreButton.snp.makeConstraints {
            $0.top.equalTo(productCollectionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(44)
            $0.trailing.equalToSuperview().offset(-44)
        }
    }
    
    func configureNavi() {
        navigationItem.title = nil
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "left-allow"),
            style: .plain,
            target: self,
            action: #selector(handleDismissal))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        let searchBarButton = UIBarButtonItem(
            image: UIImage(named: "search"),
            style: .plain,
            target: nil,
            action: nil)
        searchBarButton.tintColor = .black
        
        let basketBarButton = UIBarButtonItem(customView: basketView)
        basketBarButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [basketBarButton, searchBarButton]
    }
}

// MARK: - UICollectionViewDataSource

extension StoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == detailCollectionView {
            return DearDhaliaData.detailProductData.count
        } else {
            return DearDhaliaData.listProductData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == detailCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCustomCell.identifier, for: indexPath) as! DetailCustomCell
            cell.brandProduct = DearDhaliaData.detailProductData[indexPath.item]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCustomCell.identifer, for: indexPath) as! ProductCustomCell
            cell.brandProduct = DearDhaliaData.listProductData[indexPath.item]
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension StoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == detailCollectionView {
            return CGSize(width: 220, height: 126)
        } else {
            let width = view.frame.width - sidePadding * 2 - productSpacingPadding
            return CGSize(width: width / 2, height: productCellHeight)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == detailCollectionView {
            return UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 36)
        } else {
            return UIEdgeInsets(top: verticalPadding, left: sidePadding, bottom: 24, right: sidePadding)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == detailCollectionView {
            return 0
        } else {
            return productSpacingPadding
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == detailCollectionView {
            return 8
        } else {
            return productLinePadding
        }
    }
}

struct BrandProduct {
    let imageName: String
    let productName: String
    let price: String
    let heartCount: Int
    let commentCount: Int
}

struct DearDhaliaData {
    static let detailProductData = [
        BrandProduct(imageName: "deardahlia_main1", productName: "위클리 베스트", price: "", heartCount: 0, commentCount: 0),
        BrandProduct(imageName: "deardahlia_main2", productName: "[NEW] 신상", price: "", heartCount: 0, commentCount: 0),
        BrandProduct(imageName: "deardahlia_main3", productName: "인기상품", price: "", heartCount: 0, commentCount: 0)
    ]
    
    static let listProductData = [
        BrandProduct(imageName: "deardahlia_product1", productName: "LIP PARADISE SHEER DEW TINTED LIPSTICK", price: "28,000", heartCount: 50, commentCount: 1),
        BrandProduct(imageName: "deardahlia_product2", productName: "SENSUOUS MATTE LIP SUIT [8 colors]", price: "26,000", heartCount: 67, commentCount: 2),
        BrandProduct(imageName: "deardahlia_product3", productName: "FLAWLESS FIT EXPERT CONCEALER", price: "28,000", heartCount: 34, commentCount: 6),
        BrandProduct(imageName: "deardahlia_product4", productName: "SECRET GARDEN PALETTE FLOWER BED", price: "52,000", heartCount: 120, commentCount: 1),
        BrandProduct(imageName: "deardahlia_product5", productName: "ALLURE SHINE LUSTROUS LIP PLUMPER", price: "28,000", heartCount: 92, commentCount: 2),
        BrandProduct(imageName: "deardahlia_product6", productName: "PARADISE DREAM VOLUME &LONG LASH MASCARA", price: "30,000", heartCount: 85, commentCount: 2)]
}
