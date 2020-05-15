//
//  TestViewController.swift
//  AuthApp
//
//  Created by Viktor Smirnov on 15.05.2020.
//  Copyright © 2020 Виктор Смирнов. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    
    let searchBar = UISearchBar()
    let redView = UIView()
    let showButton = UIButton()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
        setupConstraints()
        
        
    }
    
    func setupElements() {
        view.backgroundColor = .green
        redView.backgroundColor = .red
        showButton.setTitleColor(.blue, for: .normal)
        showButton.setTitle("Show", for: .normal)
        showButton.backgroundColor = .white
        showButton.layer.cornerRadius = 10
        label.text = "Privet"
    }
    
    func setupConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [showButton, label])
        stackView.axis = .vertical
        stackView.spacing = 50
    
        
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            redView.translatesAutoresizingMaskIntoConstraints = false
//            showButton.translatesAutoresizingMaskIntoConstraints = false
//            label.translatesAutoresizingMaskIntoConstraints = false
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(searchBar)
            view.addSubview(redView)
//            view.addSubview(showButton)
//            view.addSubview(label)
            view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            redView.heightAnchor.constraint(equalToConstant: 100),
            redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1, constant: 150),
            redView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 50),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        showButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        
        ])
        
//        NSLayoutConstraint.activate([
//            showButton.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20),
//            showButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            showButton.widthAnchor.constraint(equalToConstant: 200)
//        ])
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: showButton.bottomAnchor, constant: 20),
//            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            label.widthAnchor.constraint(equalToConstant: 200)
//        ])
        
    }
}

// MARK: - SwiftUI
import SwiftUI

struct TestVCProvider: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                ContainerView().edgesIgnoringSafeArea(.all)
                    .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                    .previewDisplayName("iPhone 11 Pro")
                
                ContainerView().edgesIgnoringSafeArea(.all)
                    .previewDevice(PreviewDevice(rawValue: "iPhone 7"))
                    .previewDisplayName("iPhone 7")
            }
        }
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = TestViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<TestVCProvider.ContainerView>) -> TestViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: TestVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<TestVCProvider.ContainerView>) {
            
        }
    }
}
