//
//  SearchViewController.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 07.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupElements()
        setupConstraints()
        
        
    }

}
//MARK: - Setup View

extension SearchViewController {
    func setupElements() {
    
        title = "Search"
        view.backgroundColor = .cyan
        navigationItem.searchController = searchController
        
        
    }
}

//MARK: - Setup Constraints

extension SearchViewController {
    func setupConstraints() {
    
    }
}

