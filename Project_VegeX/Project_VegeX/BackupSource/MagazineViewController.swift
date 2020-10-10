//
//  MagazineViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class MagazineViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Properties
    
    private var safeInsetTopPadding: CGFloat = 0
    
    private lazy var magazineScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .brown
        sv.delegate = self
        return sv
    }()
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print(scrollView.contentOffset.y)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "테스트 중인 뷰"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let titleImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "exampleContents"))
        iv.snp.makeConstraints {
            $0.height.width.equalTo(200)
        }
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private let middleLabel: UILabel = {
        let label = UILabel()
        label.text = "타이틀 제목이 들어감"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    private let textView: UITextView = {
        let tv = UITextView()
        tv.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 20)
        return tv
    }()
    
    private let tailLabel: UILabel = {
        let label = UILabel()
        label.text = "타이틀 끝 들어감"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
    }
}
