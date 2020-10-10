//
//  ProductDetailViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let defaultSidePadding: CGFloat = 20
    
    private let basketView = BasketView()
    
    private let productDetailScrollView = UIScrollView()
    private let userTweetTableView = UITableView()
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "littleDrops")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let hashTextLabel: UILabel = {
        let label = UILabel()
        label.text = "🐰이 소비를 토끼가 좋아합니다"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
        label.textColor = .vegeGreen
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "리틀 드롭스 카밍 데이즈 15ml"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        label.textColor = .vegeTextBlack
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.snp.makeConstraints {
            $0.height.width.equalTo(34)
        }
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.tintColor = .vegeTextBlack
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "24,000원"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 22)
        label.textColor = .vegeGreen
        return label
    }()
    
    private let discountPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "21,600원"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 12)
        label.textColor = UIColor(rgb: 0xF28D66)
        return label
    }()
    
    private lazy var discountView: UIView = {
        let view = UIView()
        
        let discountTitleLabel = makeBasicLabel(value: "신규회원 혜택가")
        let discountContentsLabel = makeBasicLabel(value: "가입 시 10% 쿠폰")
        
        let stack = UIStackView(arrangedSubviews: [discountTitleLabel,
                                                   discountPriceLabel,
                                                   discountContentsLabel])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 12
        
        view.addSubview(stack)
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    
    private lazy var reviewCountLabel = makeBasicLabel(value: "REVIEW (45)")
    
    private let pointViewLabel: UILabel = {
        let label = UILabel()
        label.text = "216P"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 12)
        label.textColor = .vegeTextBlack
        return label
    }()
    
    private lazy var reviewAndPointView: UIView = {
        let view = UIView()
        
        let gradeStack = UIStackView()
        gradeStack.axis = .horizontal
        gradeStack.distribution = .fillEqually
        gradeStack.spacing = 4
        
        for _ in 0..<Int(5) {
            let gradeImageView = UIImageView(image: UIImage(named: "gradeStar"))
            gradeStack.addArrangedSubview(gradeImageView)
        }
        
        let gradeTotalStack = UIStackView(arrangedSubviews: [reviewCountLabel, gradeStack])
        gradeTotalStack.spacing = 12
        gradeTotalStack.axis = .horizontal
        gradeTotalStack.distribution = .fillProportionally
        
        let pointLabel = makeBasicLabel(value: "Green POINT")
        let pointStack = UIStackView(arrangedSubviews: [pointLabel, pointViewLabel])
        pointStack.spacing = 12
        pointStack.axis = .horizontal
        pointStack.distribution = .fillProportionally
        
        let totalStack = UIStackView(arrangedSubviews: [gradeTotalStack, pointStack])
        totalStack.axis = .horizontal
        totalStack.spacing = 32
        totalStack.distribution = .fillProportionally
        
        view.addSubview(totalStack)
        totalStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        return view
    }()
    
    private let guideImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "todayGo"))
        return iv
    }()
    private lazy var productCodeLabel = makeBasicLabel(value: "300872155")
    private lazy var deliveryLabel = makeBasicLabel(value: "30,000원 미만 구매 시 배송비 2,500원")
    private lazy var deliveryInfoLabel = makeBasicLabel(value: "오후 4시까지 결제하면 오늘 출발(주말/공휴일 제외)")
    
    private let amountView = ProductAmountView()
    
    private lazy var buttonWidth: CGFloat = (view.frame.width - (defaultSidePadding * 2) - 8) / 2
    private lazy var cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CART", for: .normal)
        button.setTitleColor(.vegeGreen, for: .normal)
        button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        button.layer.cornerRadius = 60 / 2
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.vegeGreen.cgColor
        button.snp.makeConstraints {
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(60)
        }
        return button
    }()
    
    private lazy var buyNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY NOW", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        button.backgroundColor = .vegeLightGreen
        button.layer.cornerRadius = 60 / 2
        button.snp.makeConstraints {
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(60)
        }
        return button
    }()
    
    private let brandMoveView = ProductBrandMoveView()
    
    private let contentsImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "littledropscontents"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        userTweetTableView.snp.updateConstraints {
            $0.height.equalTo(userTweetTableView.rectForFooter(inSection: 1).maxY)
        }
        view.layoutIfNeeded()
        
        let maxYvalue = beautyBestCollectionView.frame.maxY
        productDetailScrollView.contentSize = CGSize(width: view.frame.width, height: maxYvalue + 100)
    }
    
    // MARK: Selectors
    
    @objc func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        productDetailScrollView.backgroundColor = .white
        view.addSubview(productDetailScrollView)
        productDetailScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        productDetailScrollView.addSubview(productImageView)
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.width.equalToSuperview()
            $0.height.equalTo(452)
        }
        
        let productTitleStack = UIStackView(arrangedSubviews: [hashTextLabel, productNameLabel])
        productTitleStack.axis = .vertical
        productTitleStack.distribution = .fillProportionally
        
        productDetailScrollView.addSubview(productTitleStack)
        productDetailScrollView.addSubview(heartButton)
        productTitleStack.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(heartButton.snp.leading).offset(-8)
        }
        heartButton.snp.makeConstraints {
            $0.centerY.equalTo(productTitleStack.snp.centerY)
            $0.trailing.equalToSuperview().offset(-22)
        }
        
        productDetailScrollView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productTitleStack.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
        }
        
        let lineView1 = makeLineView(topView: priceLabel, spacing: 16)
        productDetailScrollView.addSubview(discountView)
        discountView.snp.makeConstraints {
            $0.top.equalTo(lineView1.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
        }
        
        let lineView2 = makeLineView(topView: discountView, spacing: 12)
        productDetailScrollView.addSubview(reviewAndPointView)
        reviewAndPointView.snp.makeConstraints {
            $0.top.equalTo(lineView2.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
        }
        
        let lineView3 = makeLineView(topView: reviewAndPointView, spacing: 16)
        
        let guideView = makeProductInfoView(
            titleLabel: makeBasicLabel(value: ProductInfoType.guide.description),
            trailingView: guideImageView)
        let codeView = makeProductInfoView(
            titleLabel: makeBasicLabel(value: ProductInfoType.code.description),
            trailingView: productCodeLabel)
        let deliveryPriceView = makeProductInfoView(
            titleLabel: makeBasicLabel(value: ProductInfoType.charge.description),
            trailingView: deliveryLabel)
        let deliveryInfoView = makeProductInfoView(
            titleLabel: makeBasicLabel(value: ProductInfoType.information.description),
            trailingView: deliveryInfoLabel)
        
        let productInfoStack = UIStackView(arrangedSubviews: [guideView, codeView, deliveryPriceView, deliveryInfoView])
        productInfoStack.axis = .vertical
        productInfoStack.spacing = 20
        productInfoStack.distribution = .fillProportionally
        
        productDetailScrollView.addSubview(productInfoStack)
        productInfoStack.snp.makeConstraints {
            $0.top.equalTo(lineView3.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
        }
        
        productDetailScrollView.addSubview(amountView)
        amountView.snp.makeConstraints {
            $0.top.equalTo(productInfoStack.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
            $0.trailing.equalToSuperview().offset(-defaultSidePadding)
            $0.height.equalTo(84)
        }
        
        let buttonStack = UIStackView(arrangedSubviews: [cartButton, buyNowButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 8
        
        productDetailScrollView.addSubview(buttonStack)
        buttonStack.snp.makeConstraints {
            $0.top.equalTo(amountView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        productDetailScrollView.addSubview(brandMoveView)
        brandMoveView.snp.makeConstraints {
            $0.top.equalTo(buttonStack.snp.bottom).offset(32)
            $0.height.equalTo(68)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
            $0.trailing.equalToSuperview().offset(-defaultSidePadding)
        }
        
        productDetailScrollView.addSubview(contentsImageView)
        contentsImageView.snp.makeConstraints {
            $0.top.equalTo(brandMoveView.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
        }
        
        let imageLimitView = UIView()
        imageLimitView.backgroundColor = .vegeGrayBackground
        productDetailScrollView.addSubview(imageLimitView)
        imageLimitView.snp.makeConstraints {
            $0.top.equalTo(contentsImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(12)
        }
        
        productDetailScrollView.addSubview(userTweetTableView)
        userTweetTableView.snp.makeConstraints {
            $0.top.equalTo(imageLimitView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
            $0.trailing.equalToSuperview().offset(-defaultSidePadding)
            $0.height.equalTo(500)
        }
        
        let beautyTitleLabel = UILabel()
        beautyTitleLabel.text = "뷰티 BEST"
        beautyTitleLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        beautyTitleLabel.textColor = .vegeTextBlack
        
        productDetailScrollView.addSubview(beautyTitleLabel)
        beautyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(userTweetTableView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
            $0.trailing.equalToSuperview().offset(-defaultSidePadding)
        }
        
        productDetailScrollView.addSubview(beautyBestCollectionView)
        beautyBestCollectionView.snp.makeConstraints {
            $0.top.equalTo(beautyTitleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(264)
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
    
    func makeProductInfoView(titleLabel: UILabel, trailingView: UIView) -> UIView {
        let view = UIView()
        
        let label = titleLabel
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.width.equalTo(52)
            $0.leading.centerY.equalToSuperview()
        }
        
        view.addSubview(trailingView)
        trailingView.snp.makeConstraints {
            $0.leading.equalTo(label.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        
        view.snp.makeConstraints {
            $0.height.equalTo(16)
        }
        
        return view
    }
    
    func makeBasicLabel(value string: String) -> UILabel {
        let label = UILabel()
        label.text = string
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textAlignment = .left
        label.textColor = .vegeTextBlack
        return label
    }
    
    func makeLineView(topView: UIView, spacing: CGFloat) -> UIView {
        let lineView = LineThinView()
        productDetailScrollView.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(spacing)
            $0.leading.equalToSuperview().offset(defaultSidePadding)
            $0.trailing.equalToSuperview().offset(-defaultSidePadding)
        }
        return lineView
    }
    
    private let tableViewHeaderReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "REVIEW (45)"
        label.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 18)
        label.textColor = .vegeTextBlack
        label.backgroundColor = .white
        return label
    }()
    
    private let tableViewHeaderQnALabel: UILabel = {
        let label = UILabel()
        label.text = "Q&A (5)"
        label.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 18)
        label.textColor = .vegeTextBlack
        label.backgroundColor = .white
        return label
    }()
    
    private let reviewFooterView = ProductTVFooterView(type: .review)
    private let qnaFooterView = ProductTVFooterView(type: .qna)
    private let guideFooterView = ProductTVFooterView(type: .guide)
    private let rowHeightValue: CGFloat = 56
    
    private let beautyLayout = UICollectionViewFlowLayout()
    private lazy var beautyBestCollectionView = UICollectionView(frame: .zero, collectionViewLayout: beautyLayout)
}

// MARK: UITableView Configure

extension ProductDetailViewController {
    func configureTableView() {
        userTweetTableView.backgroundColor = .white
        userTweetTableView.dataSource = self
        userTweetTableView.delegate = self
        userTweetTableView.rowHeight = 84
        userTweetTableView.isScrollEnabled = false
        
        userTweetTableView.register(ReviewCustomCell.self, forCellReuseIdentifier: ReviewCustomCell.identifier)
        userTweetTableView.register(QnaCustomCell.self, forCellReuseIdentifier: QnaCustomCell.identifier)
    }
}

// MARK: - UITableViewDataSource / UITableViewDelegate

extension ProductDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCustomCell.identifier, for: indexPath) as! ReviewCustomCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: QnaCustomCell.identifier, for: indexPath) as! QnaCustomCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let emptyView = UIView()
        emptyView.snp.makeConstraints {
            $0.height.equalTo(12)
        }
        
        let stack = UIStackView(arrangedSubviews: [emptyView])
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        
        if section == 0 {
            stack.addArrangedSubview(tableViewHeaderReviewLabel)
            return stack
        } else {
            stack.addArrangedSubview(tableViewHeaderQnALabel)
            return stack
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            return reviewFooterView
        } else {
            let stack = UIStackView(arrangedSubviews: [qnaFooterView, guideFooterView])
            stack.spacing = 12
            stack.distribution = .fillEqually
            stack.axis = .vertical
            return stack
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return rowHeightValue / 2
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return rowHeightValue
        } else {
            return (rowHeightValue * 2) + 12
        }
    }
}

// MARK: - UICollectionView Configure

extension ProductDetailViewController {
    func configureCollectionView() {
        beautyLayout.scrollDirection = .horizontal
        beautyBestCollectionView.backgroundColor = .clear
        beautyBestCollectionView.dataSource = self
        beautyBestCollectionView.delegate = self
        beautyBestCollectionView.showsHorizontalScrollIndicator = false
        
        beautyBestCollectionView.register(BeautyCustomCell.self, forCellWithReuseIdentifier: BeautyCustomCell.identifer)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ProductDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DearDhaliaData.listProductData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeautyCustomCell.identifer, for: indexPath) as! BeautyCustomCell
        cell.brandProduct = DearDhaliaData.listProductData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 264)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


