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
    let networkDataFetch = NetworkDataFetcher()
    var myTracks: SearchResponse? = nil
    
    
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
//        tableView.register(UITableViewCell, forCellReuseIdentifier: "MYcell")
        tableView.register(UINib(nibName: "TrackCell", bundle: nil), forCellReuseIdentifier: TrackCell.reuseIdentifier)
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




//MARK: UITableViewDelegate, UITableViewDataSource

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTracks?.results.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TrackCell.reuseIdentifier, for: indexPath) as! TrackCell
        let track = myTracks?.results[indexPath.row]
        
        cell.setup(track: track)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        guard let track = myTracks?.results[indexPath.row] else { return }
        let trackVC = TrackViewController()
        
        trackVC.setup(pickedTrack: track)
        present(trackVC, animated: true, completion: nil)
        
    }

    

}



//MARK: UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Тут мы будем делать сетевой запрос по URL строке
        //        print(searchText)
        
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&limit=10&media=music"
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            self.networkDataFetch.fetchTracks(urlString: urlString) { (searchResponse) in
                guard let mySearchResponse = searchResponse else { return }
                self.myTracks = mySearchResponse
                self.tableView.reloadData()
            }
        })
    }
}
