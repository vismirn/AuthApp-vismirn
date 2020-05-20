//
//  NetworkService.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 20.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error)
                } else {
                    completion(data, nil)
                }
            }
            
        }.resume()
        
    }
    
}


