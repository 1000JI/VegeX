//
//  MyProfileMenuBar.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/19.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class MyProfileMenuBar: UIView {
    
    // MARK: - Properties
    weak var delegate: MyProfileMenuBarDelegate?
    
    let firstLabelText = "프로필"
    let secondLabelText = "나의 쇼핑"
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = firstLabelText
        label.textColor = .vegeGreen
        label.textAlignment = .center
        label.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 15)
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = secondLabelText
        label.textColor = .vegeTextBlack
        label.textAlignment = .center
        label.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 15)
        return label
    }()
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .vegeGreen
        return view
    }()
    
    let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8305789828, green: 0.8256423473, blue: 0.834374249, alpha: 1)
        return view
    }()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func configureUI() {
        setConstraints()
        setGestures()
    }
    
    private func setConstraints() {
        let scene = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        let width = scene.window!.frame.width
        
        [firstLabel, secondLabel, barView, shadowView].forEach {
            addSubview($0)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview().offset(-(width / 4))
            $0.width.equalTo(40)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview().offset(width / 4)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        barView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.leading.equalTo(self.firstLabel.snp.leading).offset(-(width / 6.5))
            $0.trailing.equalTo(self.firstLabel.snp.trailing).offset(width / 6.5)
            $0.bottom.equalToSuperview()
        }
        
        shadowView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setGestures() {
        for label in [firstLabel, secondLabel] {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesuters(_:)))
            gesture.name = label.text
            label.addGestureRecognizer(gesture)
            label.isUserInteractionEnabled = true
        }
    }
    
    
    // MARK: - Helpers
    private func menuSelected(labelText: String) {
        switch labelText {
        case firstLabelText:
            self.firstLabel.textColor = .vegeGreen
            self.firstLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 15)
            [self.secondLabel].forEach {
                $0.textColor = .vegeTextBlack
                $0.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 15)
            }
        case secondLabelText:
            self.secondLabel.textColor = .vegeGreen
            self.secondLabel.font = VegeXFont.AppleSDGothicNeo_Bold.fontData(fontSize: 15)
            [self.firstLabel].forEach {
                $0.textColor = .vegeTextBlack
                $0.font = VegeXFont.AppleSDGothicNeo_Regular.fontData(fontSize: 15)
            }
        default:
            fatalError("Not Proper Menu")
        }
    }
    
    
    
    // MARK: - Selectors
    @objc private func handleGesuters(_ sender: UITapGestureRecognizer) {
        let scene = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        let width = scene.window!.frame.width
        
        UIView.animate(withDuration: 0.3, animations: {
            self.menuSelected(labelText: sender.name!)
            switch sender.name {
            case self.firstLabelText:
                self.barView.snp.removeConstraints()
                self.barView.snp.makeConstraints {
                    $0.height.equalTo(2)
                    $0.leading.equalTo(self.firstLabel.snp.leading).offset(-(width / 6.5))
                    $0.trailing.equalTo(self.firstLabel.snp.trailing).offset(width / 6.5)
                    $0.bottom.equalToSuperview()
                    self.delegate?.didSelectMenu(menu: "Profile")
                }
            case self.secondLabelText:
                self.barView.snp.removeConstraints()
                self.barView.snp.makeConstraints {
                    $0.height.equalTo(2)
                    $0.leading.equalTo(self.secondLabel.snp.leading).offset(-(width / 6.5))
                    $0.trailing.equalTo(self.secondLabel.snp.trailing).offset(width / 6.5)
                    $0.bottom.equalToSuperview()
                    self.delegate?.didSelectMenu(menu: "Shopping")
                }
            default:
                fatalError("Wrong Gesture")
            }
            self.layoutIfNeeded()
        })
    }
}

protocol MyProfileMenuBarDelegate: class {
    func didSelectMenu(menu: String)
}
