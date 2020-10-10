//
//  SearchController.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/16/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

protocol SearchControllerDelegate {
    func didStartSearching()

    func didTapOnSearchButton()

    func didTapOnCancelButton()

    func didChangeSearchText(searchText: String)
}

class SearchController : UISearchController, UISearchBarDelegate, SearchControllerDelegate {

    var customSearchBar: SearchBar!
    var customDelegate: SearchControllerDelegate!

    init(searchResultsController: UIViewController!, searchBarFrame: CGRect, searchBarFont: UIFont, searchBarTextColor: UIColor, searchBarTintColor: UIColor) {
        super.init(searchResultsController: searchResultsController)
        configureSearchBar(frame: searchBarFrame, font: searchBarFont, textColor: searchBarTextColor, bgColor: searchBarTintColor)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    func configureSearchBar(frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor) {
        self.customSearchBar = SearchBar(frame: frame, font: font , textColor: textColor)

        self.customSearchBar.placeholder = "Search"
        self.customSearchBar.barTintColor = bgColor
        self.customSearchBar.tintColor = textColor
        self.customSearchBar.showsBookmarkButton = false
        self.customSearchBar.showsCancelButton = false

        self.customSearchBar.delegate = self
        self.customDelegate = self;

        let searchBarTextField:UITextField = self.customSearchBar.value(forKey: "searchField") as! UITextField

        searchBarTextField.font = font
        searchBarTextField.layer.borderWidth = 0
        searchBarTextField.layer.cornerRadius = 3
        searchBarTextField.layer.borderColor = UIColor.lightGray.cgColor
    }

    // UISearchBarDelegate

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        customDelegate.didStartSearching()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        customSearchBar.resignFirstResponder()
        customDelegate.didTapOnSearchButton()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        customSearchBar.resignFirstResponder()
        customDelegate.didTapOnCancelButton()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        customDelegate.didChangeSearchText(searchText: searchText)
    }

    // SearchControllerDelegate

    func didStartSearching() {

    }

    func didTapOnSearchButton() {
        var searchText:String = ""

        if (self.customSearchBar.text != nil) {
            searchText = self.customSearchBar.text!
        }

        self.search(searchQuery: searchText)
    }

    func didTapOnCancelButton() {

    }

    func didChangeSearchText(searchText: String) {
        self.search(searchQuery: searchText)
    }

    // Search
    func search(searchQuery: String) {
        // Start searching
    }
}


