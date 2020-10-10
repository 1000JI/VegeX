//
//  LaunchViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/19/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    // MARK: - Properties
    private var logoImageView = UIImageView()
    private var backgroundImageView = UIImageView()
    
    private lazy var firstLineStackView = UIStackView(arrangedSubviews: [firstLineLabel1, peopleNumberLabel, firstLineLabel2])
    private var firstLineLabel1 = UILabel()
    private var firstLineLabel2 = UILabel()
    private var peopleNumberLabel = UILabel()
    
    private lazy var secondLineStackView = UIStackView(arrangedSubviews: [secondLineLabel1, treeNumberLabel])
    private var secondLineLabel1 = UILabel()
    private var treeNumberLabel = UILabel()

    /// MAximum Count to which label will be Updated
    private var maxPeopleCount : Int?
    /// Count which is currently displayed in Label
    private var currentPeopleCount : Int?
    /// Timer To animate label text
    private var updatePeopleTimer : Timer?
    
    private var maxTreeCount: Int? = 7500000
    private var currentTreeCount: Int? = 0
    private var updateTreeTimer : Timer?
    
    // MARK: Result String
    private var resultString = "" {
      didSet {
        if let doubleValue = Double(resultString) {
          peopleNumberLabel.text = formatter.string(for: doubleValue as NSNumber)
        }
      }
    }
    
    
    // MARK: - Formatter
    lazy var formatter: Formatter = {
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal  // 천 단위로 콤마(,)
      formatter.minimumFractionDigits = 0  // 최소 소수점 단위
      formatter.maximumFractionDigits = 3  // 최대 소수점 단위
      return formatter
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        dismissLaunchController()
        
        /// Start Timer
        DispatchQueue.main.async {
            self.maxPeopleCount = 500000
            self.currentPeopleCount = 0
            self.updatePeopleTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updatePeopleLabel), userInfo: nil, repeats: true)
        }
        
        DispatchQueue.main.async {
            self.maxTreeCount = 7500000
            self.currentTreeCount = 0
            self.updateTreeTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTreeNumberLabel), userInfo: nil, repeats: true)
        }
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        setPropertyAttributes()
        setConstraints()
        addConstraints()
    }
    
    private func setPropertyAttributes() {
        logoImageView.image = UIImage(named: "App_Logo")
        logoImageView.contentMode = .scaleAspectFit
        
        backgroundImageView.image = UIImage(named: "Forest")
        backgroundImageView.contentMode = .scaleAspectFit
        
        [firstLineLabel1, firstLineLabel2, secondLineLabel1].forEach {
            $0.textColor = .vegeGreen
            $0.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 18)
        }
        
        [peopleNumberLabel, treeNumberLabel].forEach {
            $0.textColor = .vegeGreen
            $0.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 18)
        }
    }
    
    private func setConstraints() {
        [logoImageView, backgroundImageView, peopleNumberLabel, treeNumberLabel].forEach {
            view.addSubview($0)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(375)
            $0.centerX.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(15)
        }
        
        peopleNumberLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        treeNumberLabel.snp.makeConstraints {
            $0.top.equalTo(peopleNumberLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }

    func addConstraints(){
        /// Add Required Constraints
        
    }
    
    // MARK: - Methods
    private func dismissLaunchController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    
    // MARK: - Selectors
    @objc func updatePeopleLabel() {
        self.peopleNumberLabel.text = "지금까지 " + formatter.string(for: currentPeopleCount! as NSNumber)! + "명이"
        currentPeopleCount! += 5321
        if currentPeopleCount! > maxPeopleCount! {
            /// Release All Values
            self.updatePeopleTimer?.invalidate()
            self.updatePeopleTimer = nil
            self.maxPeopleCount = nil
            self.currentPeopleCount = nil
            currentPeopleCount = 500000
            self.peopleNumberLabel.text = "지금까지 " + formatter.string(for: currentPeopleCount! as NSNumber)! + "명이"
        }
    }
    
    @objc func updateTreeNumberLabel() {
        self.treeNumberLabel.text = "심은 소나무 " + formatter.string(for: currentTreeCount! as NSNumber)! + "그루"
        currentTreeCount! += 79321
        if currentTreeCount! > maxTreeCount! {
            /// Release All Values
            self.updateTreeTimer?.invalidate()
            self.updateTreeTimer = nil
            self.maxTreeCount = nil
            self.currentTreeCount = nil
            currentTreeCount = 7500000
            self.treeNumberLabel.text = "심은 소나무 " + formatter.string(for: currentTreeCount! as NSNumber)! + "그루"
        }
    }
    
    // MARK: - Helpers
    private func applyAttributesInTextForAnswers(text: String, spacing: CGFloat) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        let _ = [ NSAttributedString.Key.font: VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 16) ]
        return attributedString
    }
    
    
}
