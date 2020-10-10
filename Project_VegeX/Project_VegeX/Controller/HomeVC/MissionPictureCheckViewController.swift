//
//  MissionPictureCheckViewController.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/17.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class MissionPictureCheckViewController: UIViewController {
    
    // MARK: - Properties
    
    private let confirmImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "tutorial_hamburger"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020.07.19"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let useButton = TutorialMakeButton(type: .system, buttonType: .green, text: "사용할래요")
    private let retryButton = TutorialMakeButton(type: .system, buttonType: .white, text: "다시 찍을래요")
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(confirmImageView)
        confirmImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            $0.width.equalToSuperview()
            $0.height.equalTo(confirmImageView.snp.width)
        }
        
        confirmImageView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        useButton.addTarget(self, action: #selector(handleUse), for: .touchUpInside)
        retryButton.addTarget(self, action: #selector(handleRetry), for: .touchUpInside)
        
        let buttonStack = UIStackView(arrangedSubviews: [useButton, retryButton])
        buttonStack.axis = .vertical
        buttonStack.spacing = 12
        
        view.addSubview(buttonStack)
        buttonStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(confirmImageView.snp.bottom).offset(80)
        }
    }
    
    // Selectors
    
    @objc func handleUse() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let controller = MissionCompleteViewController()
            controller.modalPresentationStyle = .overFullScreen
            controller.modalTransitionStyle = .crossDissolve
            self.present(controller, animated: false)
        }
    }
    
    @objc func handleRetry() {
        
    }
    
}
