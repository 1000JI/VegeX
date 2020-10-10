//
//  TutorialListupViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/16.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class TutorialListupViewController: UIViewController {
    
    // MARK: - Properties
    
    private var tutorials = [Tutorial]()
    private var finishCount = 0 {
        didSet { missionStatusLabel.text = "미션 성공 : \(finishCount)회" }
    }
    
    private let introduceLabel: UILabel = {
        let label = UILabel()
        label.text = TutorialSaveData.shared.tutorialIntroduceText
        label.numberOfLines = 0
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textColor = .vegeIntroTextColor
        return label
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        view.addSubview(introduceLabel)
        introduceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(20)
        }
        
        return view
    }()
    
    private let missionStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "미션 성공 : 1회"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        label.textColor = .vegeGreen
        return label
    }()
    
    private lazy var missionStatusView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        let imageView = UIImageView(image: UIImage(named: "flag-variant"))
        imageView.contentMode = .scaleToFill
        imageView.snp.makeConstraints {
            $0.height.width.equalTo(12)
        }
        
        let stack = UIStackView(arrangedSubviews: [imageView, missionStatusLabel])
        stack.axis = .horizontal
        stack.spacing = 4
        stack.distribution = .fillProportionally
        
        view.addSubview(stack)
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    
    private let tableView = UITableView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        fetchTutorials()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavi()
    }
    
    // MARK: - API
    
    func fetchTutorials() {
        tutorials = TutorialSaveData.shared.tutorialList
        
        tutorials.forEach {
            finishCount += $0.status == .finish ? 1 : 0
        }
        tableView.reloadData()
    }
    
    // MARK: - Seletors
    
    @objc func handleDismiss() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(TutorialListupCell.self, forCellReuseIdentifier: TutorialListupCell.identifier)
    }
    
    func configureUI() {
        view.backgroundColor = .vegeGrayBackground
        
        view.addSubview(topView)
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(180)
            $0.width.equalToSuperview()
        }
        
        view.addSubview(missionStatusView)
        missionStatusView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(missionStatusView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
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
}

extension TutorialListupViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TutorialListupCell.identifier, for: indexPath) as! TutorialListupCell
        if indexPath.row.isMultiple(of: 2) {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = .vegeTableViewBackgroundColor
        }
        cell.tutorial = tutorials[indexPath.row]
        return cell
    }
}
