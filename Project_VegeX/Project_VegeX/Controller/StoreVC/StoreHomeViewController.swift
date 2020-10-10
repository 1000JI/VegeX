//
//  StoreHomeViewController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/16/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

class StoreHomeViewController: UIViewController {
    
    // MARK: - Properties
    let searchBar = CustomSearchBarView()
    let bastetView = BasketView()
    let cartImageView = UIImageView()
    let bagImage = UIImage(named: "ShoppingBag")
    
    let storeMenuBar = StoreMenuBarView()
    let storeHomeView = StoreHomeMenuView()
    let storeMainView = StoreMainMenuView()
    
    var isHome: Bool = true {
        didSet {
            if isHome {
                storeHomeView.isHidden = false
                storeMainView.isHidden = true
            } else {
                storeHomeView.isHidden = true
                storeMainView.isHidden = false
            }
        }
    }

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        storeMenuBar.delegate = self
        setNavigationController()
        setPropertyAttributes()
        setConstraints()
    }
    
    private func setNavigationController() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setPropertyAttributes() {
        storeMainView.isHidden = true
        cartImageView.image = bagImage
        cartImageView.contentMode = .scaleAspectFit
    }
    
    private func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        [searchBar, bastetView, storeMenuBar, storeHomeView, storeMainView].forEach {
            view.addSubview($0)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeArea).inset(10)
            $0.leading.equalTo(safeArea).inset(20)
            $0.height.equalTo(view.frame.height / 17)
            $0.width.equalTo(view.frame.width / 1.35)
        }
        
        bastetView.snp.makeConstraints {
            $0.top.equalTo(searchBar)
            $0.leading.equalTo(searchBar.snp.trailing).offset(24)
//            $0.trailing.equalTo(safeArea)
        }
        
        storeMenuBar.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeArea)
        }
        
        storeHomeView.delegate = self
        storeHomeView.snp.makeConstraints {
            $0.top.equalTo(storeMenuBar.snp.bottom).offset(15)
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(safeArea)
            $0.width.equalToSuperview()
        }
        
        storeMainView.delegate = self
        storeMainView.snp.makeConstraints {
            $0.top.equalTo(storeMenuBar.snp.bottom).offset(15)
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(safeArea)
            $0.width.equalToSuperview()
        }
    }
    
    
    // MARK: - Selectors
    @objc private func handleBarButton(_ sender: UIBarButtonItem) {
        print(#function)
    }
    
}

extension StoreHomeViewController: StoreMenuBarViewDelegate {
    func didSelectMenu(menu: String) {
        switch menu {
        case "Home":
            isHome = true
        case "Main":
            isHome = false
        default:
            break
        }
    }
}

extension StoreHomeViewController: StoreHomeMenuViewDelegate {
    func handleDidSelect() {
        let controller = ProductDetailViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension StoreHomeViewController: StoreMainMenuViewDelegate {
    func handleBrandNew() {
        let contoller = StoreViewController()
        navigationController?.pushViewController(contoller, animated: true)
    }
}
