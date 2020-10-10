//
//  ChallengeCustomCell.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/14.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol ChallengeCustomCellDelegate: class {
    func handleRegister()
}

class ChallengeCustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ChallengeCustomCell"
    
    weak var delegate: ChallengeCustomCellDelegate?
    
    var challenge: Challenge? {
        didSet { configure() }
    }
    
    private let chaImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemPurple
        iv.image = UIImage(named: "exampleContents")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleRegister))
        iv.addGestureRecognizer(tapGesture)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.text = "[러쉬]포장지 없는 고체샴푸 사용하기"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 14)
        label.textColor = .vegeGreen
        label.numberOfLines = 2
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "매일"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020.07.19~07.26 달성률 : 20%"
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 12)
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.snp.makeConstraints {
            $0.width.equalTo(32)
            $0.height.equalTo(26)
        }
        button.setImage(UIImage(named: "home_cameraicon"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "인증하기"
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let stack = UIStackView(arrangedSubviews: [registerButton, registerLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        
        view.addSubview(stack)
        stack.snp.makeConstraints { $0.centerX.centerY.equalToSuperview() }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleRegister))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleRegister() {
        guard let challenge = challenge else { return }
        if challenge.status == .processing {
            delegate?.handleRegister()
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        let sideDefaultPadding: CGFloat = 20
        
        addSubview(chaImageView)
        chaImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(chaImageView.snp.height)
        }
        
        chaImageView.addSubview(alphaView)
        alphaView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        addSubview(contentsLabel)
        contentsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(chaImageView.snp.trailing).offset(sideDefaultPadding)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        let textStack = UIStackView(arrangedSubviews: [categoryLabel, dateLabel])
        textStack.spacing = 4
        textStack.axis = .vertical
        
        addSubview(textStack)
        textStack.snp.makeConstraints {
            $0.leading.equalTo(chaImageView.snp.trailing).offset(sideDefaultPadding)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func configure() {
        guard let challenge = challenge else { return }
        let viewModel = ChallengeViewModel(challenge: challenge)
        contentsLabel.text = challenge.title
        categoryLabel.text = challenge.cycle
        dateLabel.text = viewModel.dateText
        chaImageView.image = UIImage(named: "\(challenge.imageName)")
        
        alphaView.isHidden = viewModel.isAlphaViewHidden
        
        switch challenge.status {
        case .prepare: fallthrough
        case .processing: fallthrough
        case .popular: break
        case .finish:
            registerLabel.text = "인증완료"
            registerButton.setImage(UIImage(named: "challenge_check_circle"), for: .normal)
        }
    }
}
