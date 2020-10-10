//
//  TutorialListViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/15.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class TutorialListViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let defaultPadding: CGFloat = 20
    private let cellHeight: CGFloat = 112
    private let cellLineSpacing: CGFloat = 8
    
    private var tutorials = [Tutorial]() {
        didSet { collectionView.reloadData() }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavi()
    }
    
    // MARK: - API
    
    func fetchData() {
//        tutorials = [
//            Tutorial(title: "1일차", subTitle: "채식에 대한 오해와 진실",
//                     imageName: "tutorialimage", isFinish: true),
//            Tutorial(title: "2일차", subTitle: "나에게 맞는 채식 타입 알아보기",
//                     imageName: "tutorialimage", isFinish: true),
//            Tutorial(title: "3일차", subTitle: "주변에서 쉽게 구할 수 있는 대체 식재료",
//                     imageName: "tutorialimage", isFinish: true),
//            Tutorial(title: "4일차", subTitle: "비컨뷰티에 대해서 알아보기",
//                     imageName: "tutorialimage", isFinish: false),
//            Tutorial(title: "5일차", subTitle: "한국에서 채식을 한다는 것",
//                     imageName: "tutorialimage", isFinish: false),
//            Tutorial(title: "6일차", subTitle: "채워 넣어야 함.....",
//                     imageName: "tutorialimage", isFinish: false),
//            Tutorial(title: "7일차", subTitle: "비건 상품 고르는 방법",
//                     imageName: "tutorialimage", isFinish: false)
//        ]
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        collectionView.backgroundColor = UIColor(rgb: 0xF1F2F4)
        
        collectionView.register(TutorialCustomCell.self,
                                forCellWithReuseIdentifier: TutorialCustomCell.identifier)
    }
    
    func configureNavi() {
        navigationItem.title = "튜토리얼"
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
            action: #selector(handleDismiss))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    // MARK: - Selectors
    
    @objc func handleDismiss() {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - UICollectionViewDataSource

extension TutorialListViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tutorials.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCustomCell.identifier,
                                                      for: indexPath) as! TutorialCustomCell
        cell.layer.cornerRadius = 10
        cell.tutorial = tutorials[indexPath.item]
        return cell
    }
}

extension TutorialListViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: defaultPadding, left: defaultPadding, bottom: defaultPadding, right: defaultPadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellLineSpacing
    }
}

extension TutorialListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - defaultPadding * 2
        return CGSize(width: width, height: cellHeight)
    }
}
