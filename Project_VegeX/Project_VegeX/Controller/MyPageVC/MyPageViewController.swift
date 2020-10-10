//
//  MyPageController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let defaultPadding: CGFloat = 20
    private var isHome = true
    
    // Navi View
    
    private let basketView = BasketView()
    
    // Custom View
    
    private let topMenuBar = MyProfileMenuBar()
    private let profileView = ProfileView()
    private let challengeStatusBarView = ChallengeStatusBarView()
    
    private let shoppingMyView = ShoppingProfileView()
    private let shoppingStatusView = ShoppingStatusView()
    
    // Scroll View
    private let myProfileScrollView = UIScrollView()
    private let myShoppingScrollView = UIScrollView()
    
    private let layout = UICollectionViewFlowLayout()
    private lazy var myPictureCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    private let myShoppingTableView = UITableView()
    
    private let orderHeaderView: ShoppingTableHeaderView = {
        let hv = ShoppingTableHeaderView()
        hv.headerType = ShoppingHelpType.order
        return hv
    }()
    
    private let cancelHeaderView: ShoppingTableHeaderView = {
        let hv = ShoppingTableHeaderView()
        hv.headerType = ShoppingHelpType.cancel
        return hv
    }()
    
    private let activeHeaderView: ShoppingTableHeaderView = {
        let hv = ShoppingTableHeaderView()
        hv.headerType = ShoppingHelpType.active
        return hv
    }()
    
    private let helpersHeaderView: ShoppingTableHeaderView = {
        let hv = ShoppingTableHeaderView()
        hv.headerType = ShoppingHelpType.helpers
        return hv
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let lastIndexPath = IndexPath(item: 12 - 1, section: 0)
        guard let collectionViewAttrs = myPictureCollectionView.layoutAttributesForItem(at: lastIndexPath) else { return }
        myPictureCollectionView.snp.updateConstraints {
            $0.height.equalTo(collectionViewAttrs.frame.maxY + 8)
        }
        
        
        let lastRowIndex = ShoppingCategoryData.helpersCategory.count - 1
        let tableViewLastIndexPath = IndexPath(row: lastRowIndex, section: ShoppingHelpType.allCases.count - 1)
        let heightValue = myShoppingTableView.cellForRow(at: tableViewLastIndexPath)?.frame.maxY

        myShoppingTableView.snp.updateConstraints {
            $0.height.equalTo(heightValue!)
        }
        view.layoutIfNeeded()
        
        myProfileScrollView.contentSize = CGSize(width: view.frame.width, height: myPictureCollectionView.frame.maxY + 40)
        
        myShoppingScrollView.contentSize = CGSize(width: view.frame.width, height: myShoppingTableView.frame.maxY + shoppingStatusView.frame.maxY + 120)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        topMenuBar.delegate = self
        view.addSubview(topMenuBar)
        topMenuBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        configureHomeView()
        configureShppingView()
        
        myShoppingScrollView.isHidden = true
    }
    
    func configureShppingView() {
        myShoppingScrollView.showsVerticalScrollIndicator = false
        myShoppingScrollView.backgroundColor = .white
        view.addSubview(myShoppingScrollView)
        myShoppingScrollView.snp.makeConstraints {
            $0.top.equalTo(topMenuBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        myShoppingScrollView.addSubview(shoppingMyView)
        shoppingMyView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.leading.trailing.width.equalToSuperview()
            $0.height.equalTo(148)
        }
        
        myShoppingScrollView.addSubview(shoppingStatusView)
        shoppingStatusView.snp.makeConstraints {
            $0.top.equalTo(shoppingMyView.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(100)
        }
        
        let grayView = UIView()
        grayView.backgroundColor = .vegeGrayBackground

        myShoppingScrollView.addSubview(grayView)
        grayView.snp.makeConstraints {
            $0.top.equalTo(shoppingStatusView.snp.bottom).offset(36)
            $0.leading.trailing.width.equalToSuperview()
            $0.height.equalTo(1000)
        }
        
        grayView.addSubview(myShoppingTableView)
        myShoppingTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(800)
        }
    }
    
    func configureHomeView() {
        myProfileScrollView.showsVerticalScrollIndicator = false
        myProfileScrollView.backgroundColor = .white
        view.addSubview(myProfileScrollView)
        myProfileScrollView.snp.makeConstraints {
            $0.top.equalTo(topMenuBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        myProfileScrollView.addSubview(profileView)
        profileView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(defaultPadding)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(76)
        }
        
        myProfileScrollView.addSubview(challengeStatusBarView)
        challengeStatusBarView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.width.equalToSuperview().offset(-defaultPadding * 2)
            $0.height.equalTo(70)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = .vegeAmountBorderColor
        
        myProfileScrollView.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.top.equalTo(challengeStatusBarView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        let pictureTitleLabel = UILabel()
        pictureTitleLabel.text = "사진"
        pictureTitleLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 16)
        pictureTitleLabel.textColor = .vegeTextBlack
        
        myProfileScrollView.addSubview(pictureTitleLabel)
        pictureTitleLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(defaultPadding)
            $0.leading.equalToSuperview().offset(defaultPadding)
        }
        
        let pictureExplainLabel = UILabel()
        pictureExplainLabel.text = "내가 완성한 튜토리얼과 챌린지를 사진별로 기록하고 모아볼 수 있어요."
        pictureExplainLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        pictureExplainLabel.textColor = UIColor(rgb: 0x757575)
        
        myProfileScrollView.addSubview(pictureExplainLabel)
        pictureExplainLabel.snp.makeConstraints {
            $0.top.equalTo(pictureTitleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(defaultPadding)
        }
        
        myProfileScrollView.addSubview(myPictureCollectionView)
        myPictureCollectionView.snp.makeConstraints {
            $0.top.equalTo(pictureExplainLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(300)
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
        
        let basketBarButton = UIBarButtonItem(customView: basketView)
        basketBarButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = basketBarButton
    }
    
    func configureCollectionView() {
        myPictureCollectionView.backgroundColor = .white
        myPictureCollectionView.dataSource = self
        myPictureCollectionView.delegate = self
        myPictureCollectionView.showsVerticalScrollIndicator = false
        myPictureCollectionView.isScrollEnabled = false
        
        myPictureCollectionView.register(PictureCustomCell.self, forCellWithReuseIdentifier: PictureCustomCell.identifier)
    }
    
    func configureTableView() {
        myShoppingTableView.backgroundColor = .clear
        myShoppingTableView.isScrollEnabled = false
        myShoppingTableView.dataSource = self
        myShoppingTableView.delegate = self
        
        myShoppingTableView.register(ShoppingStatusCustomCell.self, forCellReuseIdentifier: ShoppingStatusCustomCell.identifier)
        myShoppingTableView.register(ShoppingListCustomCell.self, forCellReuseIdentifier: ShoppingListCustomCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension MyPageViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCustomCell.identifier, for: indexPath) as! PictureCustomCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MyPageViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ShoppingHelpType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingHelpType(rawValue: section)!.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ShoppingHelpType(rawValue: indexPath.section)! {
        case .order:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingStatusCustomCell.identifier, for: indexPath) as! ShoppingStatusCustomCell
            cell.shoppingType = .order
            return cell
        case .cancel:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingStatusCustomCell.identifier, for: indexPath) as! ShoppingStatusCustomCell
            cell.shoppingType = .cancel
            return cell
        case .active:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListCustomCell.identifier, for: indexPath) as! ShoppingListCustomCell
            cell.name = ShoppingCategoryData.activeCategory[indexPath.row]
            return cell
        case .helpers:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListCustomCell.identifier, for: indexPath) as! ShoppingListCustomCell
            cell.name = ShoppingCategoryData.helpersCategory[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch ShoppingHelpType(rawValue: section)! {
        case .order: return orderHeaderView
        case .cancel: return cancelHeaderView
        case .active: return activeHeaderView
        case .helpers: return helpersHeaderView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch ShoppingHelpType(rawValue: indexPath.section)! {
        case .order: return 54
        case .cancel: return 54
        case .active: return 50
        case .helpers: return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
}

extension MyPageViewController: MyProfileMenuBarDelegate {
    func didSelectMenu(menu: String) {
        if menu == "Profile" {
            myProfileScrollView.isHidden = false
            myShoppingScrollView.isHidden = true
        } else {
            myProfileScrollView.isHidden = true
            myShoppingScrollView.isHidden = false
        }
    }
}
