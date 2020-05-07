//
//  MainTabBarController.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 07.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchVC = SearchViewController()
        let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        
        tabBar.tintColor = .red
        tabBar.barTintColor = .blue
        
        
        
        guard let musicImage = UIImage(systemName: "music.house") else { return }
        guard let profileImage = UIImage(systemName: "person.crop.square") else { return }
        viewControllers = [generationNC(rootViewController: searchVC, image: musicImage, title: "Музыка"),
                           generationNC(rootViewController: profileVC, image: profileImage, title: "Профиль")]
        
        
    }
    
    func generationNC(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.navigationBar.prefersLargeTitles = true
        
        
        
        return navigationVC
    }
    
     
}
