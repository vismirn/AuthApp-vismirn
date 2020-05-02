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
    @IBOutlet weak var familyTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var firstname: String?
    var lastname: String?
    var image: UIImage?
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameTextField.text = firstname
        familyTextField.text = lastname
        myImageView.image = image
        emailTextField.text = email
        passwordTextField.text = password
        
    }

    @IBAction func shareButtonTapped(_ sender: UIButton) {
    }
    @IBAction func changeInfoTapped(_ sender: Any) {
    }
    
    
}
