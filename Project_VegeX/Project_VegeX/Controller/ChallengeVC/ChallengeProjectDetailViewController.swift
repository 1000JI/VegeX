//
//  ChallengeProjectDetailViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/18/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class ChallengeProjectDetailViewController: UIViewController {
    
    // MARK: - Properties
    let dataBrain = DataBrain()
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "left-allow"), style: .plain, target: self, action: #selector(handleBackButton(_:)))
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let mainImageView = UIImageView()
    
    lazy var mainTitleDateStackView = UIStackView(arrangedSubviews: [mainTitleLabel, mainDateLabel])
    let mainTitleLabel = UILabel()
    let mainDateLabel = UILabel()
    
    // Challenger & Tree Info
    lazy var challengerTreeInfoStackView = UIStackView(arrangedSubviews: [challengerInfoStackView, treeInfoStackView])
    lazy var challengerInfoStackView = UIStackView(arrangedSubviews: [challengerInfoLable, challengerNumberLabel])
    let challengerInfoLable = UILabel()
    let challengerNumberLabel = UILabel()
    
    lazy var treeInfoStackView = UIStackView(arrangedSubviews: [treeInfoLabel, treeNumberLabel])
    let treeInfoLabel = UILabel()
    let treeNumberLabel = UILabel()
    
    // Buttons
    let buttonStackView = UIStackView()
    let buttons = ["다른 도전자 확인하기", "친구 초대하기"]
    
    // Project Details
    lazy var projectDetailStackViewArray = [brandIntroStackView, projectIntroStackView, projectRewardStackView]
    let brandIntroStackView = UIStackView()
    let projectIntroStackView = UIStackView()
    let projectRewardStackView = UIStackView()
    var dividers = [UIView]()
    
    // Instruction StackView
    let instructionStackView = UIStackView()
    let instructionSectionDivider = UIView()
    let instructionsConditionLabel = UILabel()
    
    // Challenge Comments
    let challengeReviewView = ChallengeProjectReviewView()
    let commentTableView = UITableView()
    
    // Participate Button
    let participateButton = UIButton()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        scrollView.contentSize = CGSize(width: view.frame.width, height: contentView.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: commentTableView.frame.maxY + 50)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        setStackView()
        setPropertyAttributes()
        setConstraints()
        setTableView()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .vegeTextBlack
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "챌린지"
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setPropertyAttributes() {
        generateButtons(buttonTitles: buttons)
        generateTitleAndDescription()
        generateInstructions()
        
        // Set textAlignment to Left
        [mainTitleLabel, mainDateLabel, challengerInfoLable, challengerNumberLabel, treeInfoLabel, treeNumberLabel].forEach {
            $0.textAlignment = .left
        }
        
        // Main
        mainImageView.image = UIImage(named: dataBrain.challengeProjectTitleData["image"]!)
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.clipsToBounds = true
        
        mainTitleLabel.text = dataBrain.challengeProjectTitleData["title"]!
        mainTitleLabel.textColor = .vegeGreen
        mainTitleLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 20)
        
        mainDateLabel.text = dataBrain.challengeProjectTitleData["date"]!
        mainDateLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 15)
        
        // Challenger & Tree
        [challengerInfoLable, treeInfoLabel].forEach {
            $0.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 15)
        }
        
        [challengerNumberLabel, treeNumberLabel].forEach {
            $0.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 20)
        }
        
        challengerInfoLable.text = dataBrain.challengeProjectSubInfoData["challenger"]!
        challengerNumberLabel.text = dataBrain.challengeProjectSubInfoData["challengerNumber"]!
        
        treeInfoLabel.text = dataBrain.challengeProjectSubInfoData["tree"]!
        treeNumberLabel.text = dataBrain.challengeProjectSubInfoData["treeNumber"]!
        
        // Instructions
        instructionSectionDivider.backgroundColor = UIColor(rgb: 0xDADCE0)
        
        instructionsConditionLabel.attributedText = applyAttributesInTextForAnswers(text: dataBrain.challengeProjectInstructionConditionInfo[0], spacing: 5)
        instructionsConditionLabel.textAlignment = .left
        instructionsConditionLabel.textColor = .vegeTextBlack
        instructionsConditionLabel.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        instructionsConditionLabel.numberOfLines = 0
        
        // Challenge Comments
        challengeReviewView.titleLabel.text = "[도전후기]"
        challengeReviewView.numberOfCommentLabel.text = "22+"
        challengeReviewView.commentImageView.image = UIImage(named: "chat")
        
        // Participate Button
        participateButton.setTitle("참가하기", for: .normal)
        participateButton.setTitleColor(.white, for: .normal)
        participateButton.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        participateButton.backgroundColor = .vegeLightGreen
        participateButton.layer.cornerRadius = view.frame.height / 26
        participateButton.addTarget(self, action: #selector(handleJoinEvent), for: .touchUpInside)
    }
    
    private func setStackView() {
        mainTitleDateStackView.alignment = .leading
        mainTitleDateStackView.axis = .vertical
        mainTitleDateStackView.distribution = .fillEqually
        mainTitleDateStackView.spacing = 0
        
        [challengerInfoStackView, treeInfoStackView].forEach {
            $0.alignment = .leading
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = 5
        }
        [challengerTreeInfoStackView].forEach {
            $0.alignment = .leading
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = 50
        }
        [buttonStackView].forEach {
            $0.alignment = .center
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 11
        }
        projectDetailStackViewArray.forEach {
            $0.alignment = .leading
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.spacing = 5
        }
        instructionStackView.alignment = .center
        instructionStackView.axis = .vertical
        instructionStackView.distribution = .fillEqually
        instructionStackView.spacing = 20
    }
    
    private func setTableView() {
        commentTableView.register(ChallengeProjectCommentTableViewCell.self, forCellReuseIdentifier: ChallengeProjectCommentTableViewCell.identifier)
        commentTableView.dataSource = self
        commentTableView.delegate = self
        commentTableView.isScrollEnabled = false
        commentTableView.rowHeight = 100
        commentTableView.separatorColor = .clear
        commentTableView.allowsSelection = false
    }
    
    private func setConstraints() {
        // Add Views
        [scrollView, participateButton].forEach {
            view.addSubview($0)
        }
        scrollView.addSubview(contentView)
        [mainImageView, mainTitleDateStackView, challengerTreeInfoStackView, buttonStackView, instructionStackView, instructionSectionDivider, instructionsConditionLabel, challengeReviewView, commentTableView].forEach {
            contentView.addSubview($0)
        }
        projectDetailStackViewArray.forEach {
            contentView.addSubview($0)
        }
        
        // Auto Layouts
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(scrollView)
            $0.width.equalTo(view.frame.width)
            $0.height.equalTo(view.frame.height * 3)
        }
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(300)
        }
        mainTitleDateStackView.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(mainImageView)
            $0.height.equalTo(50)
        }
        challengerTreeInfoStackView.snp.makeConstraints {
            $0.top.equalTo(mainTitleDateStackView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(mainImageView)
            $0.height.equalTo(50)
        }
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(challengerTreeInfoStackView.snp.bottom).offset(32)
            $0.leading.trailing.equalTo(mainImageView)
        }
        
        for index in projectDetailStackViewArray.indices {
            let divider = UIView()
            divider.backgroundColor = UIColor(rgb: 0xDADCE0)
            contentView.addSubview(divider)
            dividers.append(divider)
            
            if index == 0 {
                projectDetailStackViewArray[index].snp.makeConstraints {
                    $0.top.equalTo(buttonStackView.snp.bottom).offset(50)
                    $0.leading.trailing.equalTo(mainImageView)
                }
            } else {
                projectDetailStackViewArray[index].snp.makeConstraints {
                    $0.top.equalTo(dividers[index - 1].snp.bottom).offset(15)
                    $0.leading.trailing.equalTo(mainImageView)
                }
            }
            divider.snp.makeConstraints {
                $0.top.equalTo(projectDetailStackViewArray[index].snp.bottom).offset(20)
                $0.leading.trailing.equalTo(mainImageView)
                $0.height.equalTo(1)
            }
        }
        instructionStackView.snp.makeConstraints {
            $0.top.equalTo(dividers.last!.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(mainImageView)
        }
        instructionSectionDivider.snp.makeConstraints {
            $0.top.equalTo(instructionStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(mainImageView)
            $0.height.equalTo(1)
        }
        instructionsConditionLabel.snp.makeConstraints {
            $0.top.equalTo(instructionSectionDivider).offset(20)
            $0.leading.trailing.equalTo(mainImageView)
        }
        challengeReviewView.snp.makeConstraints {
            $0.top.equalTo(instructionsConditionLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(mainImageView)
        }
        commentTableView.snp.makeConstraints {
            $0.top.equalTo(challengeReviewView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(mainImageView)
            $0.height.equalTo(500)
        }
        participateButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(view.frame.width / 1.3)
            $0.height.equalTo(view.frame.height / 13)
        }
    }
    
    
    // MARK: - Helpers
    private func generateButtons(buttonTitles: [String]) {
        for index in 0...1 {
            let button = UIButton()
            button.setTitle(buttonTitles[index], for: .normal)
            button.setTitleColor(.vegeTextBlack, for: .normal)
            button.titleLabel?.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
            button.backgroundColor = UIColor(rgb: 0xE0EAE5)
            button.layer.cornerRadius = 5
            button.snp.makeConstraints {
                $0.height.equalTo(40)
            }
            buttonStackView.addArrangedSubview(button)
        }
    }
    
    private func generateTitleAndDescription() {
        let data = dataBrain.challengeProjectDetailData
        for index in data.indices {
            let title = UILabel()
            title.attributedText = applyAttributesInTextForAnswers(text: data[index]["title"]!, spacing: 5)
            title.font = VegeXFont.AppleSDGothicNeo_SemiBold.fontData(fontSize: 16)
            
            let description = UILabel()
            description.attributedText = applyAttributesInTextForAnswers(text: data[index]["description"]!, spacing: 5)
            description.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 14)
            
            [title, description].forEach {
                $0.textColor = .vegeTextBlack
                $0.numberOfLines = 0
                projectDetailStackViewArray[index].addArrangedSubview($0)
            }
        }
    }
    
    private func generateInstructions() {
        for index in dataBrain.challengeProjectInstructionData.indices {
            let instructionView = ChallengeProjectDetailInstructionView()
            instructionView.mainTitle.text = dataBrain.challengeProjectInstructionData[index]["title"]
            instructionView.firstImageView.image = UIImage(named: dataBrain.challengeProjectInstructionData[index]["image1"]!)
            instructionView.secondImageView.image = UIImage(named: dataBrain.challengeProjectInstructionData[index]["image2"]!)
            instructionView.descriptionLabel.attributedText = applyAttributesInTextForAnswers(text: dataBrain.challengeProjectInstructionData[index]["description"]!, spacing: 2)
            
            instructionStackView.addArrangedSubview(instructionView)
        }
    }
    
    private func applyAttributesInTextForAnswers(text: String, spacing: CGFloat) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        let _ = [ NSAttributedString.Key.font: VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16) ]
        return attributedString
    }
    
    
    // MARK: - Selectors
    @objc func handleBackButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleJoinEvent() {
        let controller = ChallengeMissionViewController()
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        controller.delegate = self
        present(controller, animated: true)
    }
    
}


// MARK: - UITableViewDataSource
extension ChallengeProjectDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBrain.challengeProjectCommentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = commentTableView.dequeueReusableCell(withIdentifier: ChallengeProjectCommentTableViewCell.identifier, for: indexPath) as? ChallengeProjectCommentTableViewCell else { fatalError() }
        cell.profileImageView.image = UIImage(named: dataBrain.challengeProjectCommentData[indexPath.row]["image"]!)
        cell.nameLabel.text = dataBrain.challengeProjectCommentData[indexPath.row]["name"]
        cell.dateLabel.text = dataBrain.challengeProjectCommentData[indexPath.row]["date"]
        cell.commentLabel.attributedText = applyAttributesInTextForAnswers(text: dataBrain.challengeProjectCommentData[indexPath.row]["comment"]!, spacing: 1)
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ChallengeProjectDetailViewController: UITableViewDelegate {
    
}

extension ChallengeProjectDetailViewController: ChallengeMissionViewControllerDelegate {
    func handleDismissal() {
        DispatchQueue.main.async {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
