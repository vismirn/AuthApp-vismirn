//
//  NetworkDataFetcher.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 20.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    let networkService = NetworkService()
    
    func fetchTracks(urlString: String, completion: @escaping (SearchResponse?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            guard let data = data else { return }
            do {
                let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(tracks)
            } catch let jsonError {
                completion(nil)
                print(jsonError.localizedDescription)
            }
        }
    }
}
