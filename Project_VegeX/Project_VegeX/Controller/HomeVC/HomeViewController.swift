//
//  HomeViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit
import MobileCoreServices

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var presentTutorial: Tutorial? {
        didSet {
            dailyMissionView.tutorial = presentTutorial
        }
    }
    
    private var isProcessingCategory = true {
        didSet { tableView.reloadData() }
    }
    private var isTutorialCamera = true
    
    private let defaultPadding: CGFloat = 20
    
    private let homeScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = UIColor(rgb: 0xF1F2F4)
        return sv
    }()
    
    // Custom View
    
    private let dailyMissionView = DailyMissionView()
    
    private let mainIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.snp.makeConstraints {
            $0.width.height.equalTo(52)
        }
        iv.image = UIImage(named: "02dh")
        return iv
    }()
    
    private let myNameLabel: UILabel = {
        let label = UILabel()
        label.text = "윤다혜 님, 반가워요!"
        label.textColor = UIColor(rgb: 0x156941)
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16)
        return label
    }()
    
    private let myPointLabel: UILabel = {
        let label = UILabel()
        label.text = "건강한 습관 15일째"
        label.textColor = UIColor(rgb: 0x156941)
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 20)
        return label
    }()
    
    private lazy var alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "alert"), for: .normal)
        button.tintColor = .black
        button.snp.makeConstraints {
            $0.width.height.equalTo(32)
        }
        button.addTarget(self, action: #selector(handleAlert), for: .touchUpInside)
        return button
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        let myStack = UIStackView(arrangedSubviews: [myNameLabel, myPointLabel])
        myStack.axis = .vertical
        myStack.spacing = -8
        myStack.distribution = .fillProportionally
        
        let amountStack = UIStackView(arrangedSubviews: [mainIconImageView, myStack])
        amountStack.axis = .horizontal
        amountStack.spacing = 8
        amountStack.distribution = .fillProportionally
        
        view.addSubview(amountStack)
        
        amountStack.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(12)
            $0.leading.equalTo(view.snp.leading).offset(defaultPadding)
        }
        
        view.addSubview(alertButton)
        alertButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(6)
            $0.trailing.equalTo(view.snp.trailing).offset(-13)
        }
        return view
    }()
    
    private lazy var tutorialLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 보기"
        label.font = .systemFont(ofSize: 14)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTutorialEvent))
        label.addGestureRecognizer(tapGesture)
        
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var challengeLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 보기"
        label.font = .systemFont(ofSize: 14)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleChallengeEvent))
        label.addGestureRecognizer(tapGesture)
        
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var chaSegment: CustomSegmentControl = {
        let cs = CustomSegmentControl()
        cs.backgroundColor = .white
        cs.layer.cornerRadius = 20
        cs.delegate = self
        return cs
    }()
    
    private let tableView = UITableView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavi()
        fetchTutorialData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        homeScrollView.contentSize = CGSize(
            width: view.frame.width,
            height: tableView.frame.maxY + 20)
    }
    
    // MARK: - API
    
    func fetchTutorialData() {
        TutorialService.shared.getPresentTutorial { tutorial in
            self.presentTutorial = tutorial
        }
        tableView.reloadData()
    }
    
    // MARK: - Selectors
    
    @objc func handleAlert() {
        let controller = ProductDetailViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleMissionEvent() {
        let controller = TutorialMissionViewController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    @objc func handleTutorialEvent() {
        let controller = TutorialListupViewController()
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleChallengeEvent() {
        let controller = ChallengeTitleViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helpers
    
    func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 112
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        
        tableView.register(ChallengeCustomCell.self,
                           forCellReuseIdentifier: ChallengeCustomCell.identifier)
    }
    
    func configureNavi() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureUI() {
        let protectView = UIView()
        protectView.backgroundColor = .white
        view.addSubview(protectView)
        
        protectView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        view.addSubview(homeScrollView)
        homeScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        homeScrollView.addSubview(topView)
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
            $0.width.equalToSuperview()
        }
        
        let dailyMissionTitleView = makeHeaderView(titleText: "튜토리얼", detailLabel: tutorialLabel)
        homeScrollView.addSubview(dailyMissionTitleView)
        dailyMissionTitleView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(20)
        }
        
        dailyMissionView.delegate = self
        homeScrollView.addSubview(dailyMissionView)
        dailyMissionView.snp.makeConstraints {
            $0.top.equalTo(dailyMissionTitleView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(120)
        }
        
        let challengeTitleView = makeHeaderView(titleText: "챌린지",
                                                detailLabel: challengeLabel,
                                                subTitleText: "사람들과 함께 건강해져요")
        homeScrollView.addSubview(challengeTitleView)
        challengeTitleView.snp.makeConstraints {
            $0.top.equalTo(dailyMissionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(42)
        }
        
        homeScrollView.addSubview(chaSegment)
        chaSegment.snp.makeConstraints {
            $0.top.equalTo(challengeTitleView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(40)
        }
        
        homeScrollView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(chaSegment.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(defaultPadding)
            $0.trailing.equalToSuperview().offset(-defaultPadding)
            $0.height.equalTo(128 * 5)
        }
    }
    
    func makeHeaderView(titleText: String, detailLabel: UILabel, subTitleText: String? = nil) -> UIView {
        let customView = UIView()
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        titleLabel.textColor = .label
        
        let allowImageView = UIImageView(image: UIImage(named: "right-allow"))
        allowImageView.snp.makeConstraints {
            $0.width.height.equalTo(20)
        }
        
        let viewMoveStack = UIStackView(arrangedSubviews: [detailLabel, allowImageView])
        viewMoveStack.axis = .horizontal
        viewMoveStack.spacing = 0
        viewMoveStack.distribution = .fillProportionally
        
        customView.addSubview(viewMoveStack)
        viewMoveStack.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
        }
        
        guard let subTitleText = subTitleText else {
            customView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints {
                $0.top.leading.bottom.equalToSuperview()
            }
            return customView
        }
        
        let subTitleLabel = UILabel()
        subTitleLabel.text = subTitleText
        subTitleLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
        subTitleLabel.textColor = .label
        
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        labelStack.axis = .vertical
        labelStack.distribution = .fillProportionally
        labelStack.spacing = 4
        
        customView.addSubview(labelStack)
        labelStack.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        return customView
    }
    
    func makeDailyMissionView(day: String, missoinSubTitle: String, imageName: String) -> UIView {
        let missionView = UIView()
        missionView.layer.cornerRadius = 10
        missionView.clipsToBounds = true
        missionView.layer.shadowColor = UIColor.lightGray.cgColor
        missionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        missionView.layer.shadowRadius = 5
        missionView.layer.shadowOpacity = 0.5
        
        
        let missionImageView = UIImageView(image: UIImage(named: imageName))
        missionImageView.contentMode = .scaleAspectFill
        missionView.addSubview(missionImageView)
        missionImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let alphaView = UIView()
        alphaView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        missionImageView.addSubview(alphaView)
        alphaView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        let dayLabel = UILabel()
        dayLabel.text = day
        dayLabel.textAlignment = .center
        dayLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 16)
        dayLabel.textColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = missoinSubTitle
        titleLabel.textAlignment = .center
        titleLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 18)
        titleLabel.textColor = .white
        
        let titleStack = UIStackView(arrangedSubviews: [dayLabel, titleLabel])
        titleStack.axis = .vertical
        titleStack.spacing = 4
        titleStack.alignment = .center
        
        missionView.addSubview(titleStack)
        titleStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(24)
        }
        
        let statusButton = UIButton(type: .system)
        statusButton.setTitle("시작하기", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        statusButton.layer.borderColor = UIColor.white.cgColor
        statusButton.layer.borderWidth = 1.0
        statusButton.layer.cornerRadius = 28 / 2
        
        missionView.addSubview(statusButton)
        statusButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(28)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleStack.snp.bottom).offset(12)
        }
        
        return missionView
    }
    
    private lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        return imagePicker
    }()
    
    func certifyShowAlert() {
        let certifyAlert = UIAlertController(title: "인증에 필요한 사진을 촬영하거나 가져오세요.", message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "카메라로 촬영하기", style: .default) { ACTION in
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
            self.imagePicker.sourceType = .camera
            self.imagePicker.mediaTypes = [kUTTypeImage] as [String]
            self.present(self.imagePicker, animated: true)
        }
        
        let albumAction = UIAlertAction(title: "앨범에서 가져오기", style: .default) { ACTION in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.mediaTypes = [kUTTypeImage] as [String]
            self.present(self.imagePicker, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        certifyAlert.addAction(cameraAction)
        certifyAlert.addAction(albumAction)
        certifyAlert.addAction(cancelAction)
        
        present(certifyAlert, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return isProcessingCategory ?
            ChallengeSaveData.shared.proccessingData.count :
            ChallengeSaveData.shared.popularData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChallengeCustomCell.identifier, for: indexPath) as! ChallengeCustomCell
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        cell.delegate = self
        
        cell.challenge = isProcessingCategory ?
            ChallengeSaveData.shared.proccessingData[indexPath.section] :
            ChallengeSaveData.shared.popularData[indexPath.section]
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
}

// MARK: - ChallengeCustomCellDelegate

extension HomeViewController: ChallengeCustomCellDelegate {
    func handleRegister() {
        isTutorialCamera = false
        certifyShowAlert()
    }
}

// MARK: - DailyMissionViewDelegate

extension HomeViewController: DailyMissionViewDelegate {
    func handleStatusEvent() {
        guard let tutorial = presentTutorial else { return }
        switch tutorial.status {
        case .start:
            let controller = TutorialDetailViewController()
            controller.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(controller, animated: true)
        case .ongoing:
            isTutorialCamera = true
            certifyShowAlert()
        case .finish: break
        }
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension HomeViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        var isCompleted = false
        if isTutorialCamera {
            let mediaType = info[.mediaType] as! NSString
            if UTTypeEqual(mediaType, kUTTypeImage) {
                let originalImage = info[.originalImage] as! UIImage
                let editedImage = info[.editedImage] as? UIImage
                
                let selectedImage = editedImage ?? originalImage
//                imageView.image = selectedImage
                
                guard let presentTutorial = presentTutorial else { return }
                TutorialService.shared.setTutorial(to: presentTutorial, status: .finish)
                TutorialService.shared.getPresentTutorial { tutorial in
                    self.presentTutorial = tutorial
                }
                isCompleted = true
            }
            picker.presentingViewController?.dismiss(animated: true, completion: {
                guard isCompleted else { return }
                
                DispatchQueue.main.async {
                    let controller = TutorialMissionCompleteViewController()
                    controller.hidesBottomBarWhenPushed = true
                    self.present(controller, animated: true)
                }
            })
        } else {
            let mediaType = info[.mediaType] as! NSString
            if UTTypeEqual(mediaType, kUTTypeImage) {
                let originalImage = info[.originalImage] as! UIImage
                let editedImage = info[.editedImage] as? UIImage
                
                let selectedImage = editedImage ?? originalImage
//                imageView.image = selectedImage
                
                isCompleted = true
            }
            picker.presentingViewController?.dismiss(animated: true, completion: {
                guard isCompleted else { return }
                
                DispatchQueue.main.async {
                    let controller = MissionPictureCheckViewController()
                    controller.hidesBottomBarWhenPushed = true
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true)
                }
            })
        }
    }
}

extension HomeViewController: CustomSegmentControlDelegate {
    func handleButtonEvent(isLeftButton: Bool) {
        isProcessingCategory = isLeftButton
    }
}
