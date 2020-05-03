//
//  ProfileViewController.swift
//  AuthApp
//
//  Created by Алексей Пархоменко on 29.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    
    var firstname: String?
    var lastname: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameTextField.text = firstname
        lastNameTextField.text = lastname
        myImageView.image = image

    }
    @IBAction func changeInfoTapped(_ sender: Any) {
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
    }
}
