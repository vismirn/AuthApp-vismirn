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
    let tableView = UITableView(frame: .zero, style: .plain)
    var timer: Timer?
    
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
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MYcell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        searchController.searchBar.delegate = self
        
        
        
        
    }
}

//MARK: - Setup Constraints

extension SearchViewController {
    func setupConstraints() {
    
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MYcell", for: indexPath)
        cell.textLabel?.text = "indexPath \(indexPath)"
        return cell
    }
    
    
    
    }
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Тут мы будем делать сетевой запрос по URL строке
//        print(searchText)
        
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&limit=10"
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { (data, respons, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
//                print(data)
                guard let data = data else { return }
                do {
                    let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                    tracks.results.forEach { (track) in
                        print(track.trackName)
                    }
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }.resume()
        })
        
        
        
        
    }
}
