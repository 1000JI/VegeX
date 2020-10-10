//
//  ChallengeTitleViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/15.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeTitleViewController: UIViewController {
    
    // MARK: - Properties
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "left-allow"), style: .plain, target: self, action: #selector(handleBackButton(_:)))
    
    let popularCollectionViewData = DataBrain().challengeTitleVCPopularData
    let brandCollectionViewData = DataBrain().challengeTitleVCBrandData
    let recentCollectionViewData = DataBrain().challengeTitleVCRecentData
    let menuBar = TripleMenuBarView()
    
    let popularView = UIView()
    let brandView = UIView()
    let recentView = UIView()
    
    let scrollView = UIScrollView()
    let popularCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .vegeGrayBackground
        return collectionView
    }()
    let brandCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .vegeGrayBackground
        collectionView.isHidden = true
        return collectionView
    }()
    let recentCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .vegeGrayBackground
        collectionView.isHidden = true
        return collectionView
    }()
    
    var selectedViewNumber: Int = 1 {
        willSet {
            switch newValue {
            case 0:
                popularCollectionView.isHidden = false
                brandCollectionView.isHidden = true
                recentCollectionView.isHidden = true
            case 1:
                popularCollectionView.isHidden = true
                brandCollectionView.isHidden = false
                recentCollectionView.isHidden = true
            case 2:
                popularCollectionView.isHidden = true
                brandCollectionView.isHidden = true
                recentCollectionView.isHidden = false
            default:
                break
            }
        }
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.tintColor = .vegeTextBlack
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        menuBar.delegate = self
        setNavigationController()
        setConstraints()
        setCollectionView()
        popularCollectionView.isPagingEnabled = true
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .vegeTextBlack
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        navigationItem.title = "챌린지"
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setConstraints() {
        [menuBar, popularCollectionView, brandCollectionView, recentCollectionView].forEach {
            view.addSubview($0)
        }
        
        let safeArea = view.safeAreaLayoutGuide
        menuBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeArea)
            $0.height.equalTo(44)
        }
        
        popularCollectionView.snp.makeConstraints {
            $0.top.equalTo(menuBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
        
        brandCollectionView.snp.makeConstraints {
            $0.top.equalTo(menuBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
        
        recentCollectionView.snp.makeConstraints {
            $0.top.equalTo(menuBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
    }
    
    private func setCollectionView() {
        [popularCollectionView, brandCollectionView, recentCollectionView].forEach {
            $0.register(ChallengeTitleCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeTitleCollectionViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    
    // MARK: - Helpers
    
    
    // MARK: - Selectors
    @objc private func handleBackButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}


// MARK: - UICollectionViewDataSource
extension ChallengeTitleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case popularCollectionView:
            return popularCollectionViewData.count
        case brandCollectionView:
            return brandCollectionViewData.count
        case recentCollectionView:
            return recentCollectionViewData.count
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case popularCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeTitleCollectionViewCell.identifier, for: indexPath) as? ChallengeTitleCollectionViewCell else { fatalError("No Cell Info") }
            let image = popularCollectionViewData[indexPath.item]["Image"]!
            let title = popularCollectionViewData[indexPath.item]["MainTitle"]!
            let missionType = popularCollectionViewData[indexPath.item]["MissionType"]!
            let date = popularCollectionViewData[indexPath.item]["Date"]!
            let likes = popularCollectionViewData[indexPath.item]["like"]!
            let comments = popularCollectionViewData[indexPath.item]["comment"]!
            cell.configureData(image: image, title: title, missionType: missionType, date: date, likes: likes, comments: comments)
            return cell
        case brandCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeTitleCollectionViewCell.identifier, for: indexPath) as? ChallengeTitleCollectionViewCell else { fatalError("No Cell Info") }
            let image = brandCollectionViewData[indexPath.item]["Image"]!
            let title = brandCollectionViewData[indexPath.item]["MainTitle"]!
            let missionType = brandCollectionViewData[indexPath.item]["MissionType"]!
            let date = brandCollectionViewData[indexPath.item]["Date"]!
            let likes = brandCollectionViewData[indexPath.item]["like"]!
            let comments = brandCollectionViewData[indexPath.item]["comment"]!
            cell.configureData(image: image, title: title, missionType: missionType, date: date, likes: likes, comments: comments)
            return cell
        case recentCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeTitleCollectionViewCell.identifier, for: indexPath) as? ChallengeTitleCollectionViewCell else { fatalError("No Cell Info") }
            let image = recentCollectionViewData[indexPath.item]["Image"]!
            let title = recentCollectionViewData[indexPath.item]["MainTitle"]!
            let missionType = recentCollectionViewData[indexPath.item]["MissionType"]!
            let date = recentCollectionViewData[indexPath.item]["Date"]!
            let likes = recentCollectionViewData[indexPath.item]["like"]!
            let comments = recentCollectionViewData[indexPath.item]["comment"]!
            cell.configureData(image: image, title: title, missionType: missionType, date: date, likes: likes, comments: comments)
            return cell
        default:
            fatalError()
        }
    }
}


// MARK: - UICollectionViewDelegate
extension ChallengeTitleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = ChallengeProjectDetailViewController()
        nextVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(nextVC, animated: true)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ChallengeTitleViewController: UICollectionViewDelegateFlowLayout {
    
    struct CollectionViewLayout {
        static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        static let lineSpacing: CGFloat = 10
        static let itemSpacing: CGFloat = 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return CollectionViewLayout.edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let height = view.frame.height
        let itemSize = CGSize(width: width / 2.18, height: height / 2.5)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionViewLayout.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionViewLayout.itemSpacing
    }
    
}


extension ChallengeTitleViewController: TripleMenuBarViewDelegate {
    func menuDidSelected(selectedView: Int) {
        selectedViewNumber = selectedView
    }
}
