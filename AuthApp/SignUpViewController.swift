//
//  SignUpViewController.swift
//  AuthApp
//
//  Created by Алексей Пархоменко on 29.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var familyTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var registrButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registrButton.isHidden = false
        
//        if firstnameTextField.text != nil {
//                 registrButton.isHidden = true
//             }

    
    }
    
    @IBAction func photoButtonTapped(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        present(imagePickerController, animated: true)
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
    }
    
    
    @IBAction func registrTapped(_ sender: Any) {
        let mainTabBap = MainTabBarController()
        mainTabBap.modalPresentationStyle = .fullScreen
        
        present(mainTabBap, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destinationVC = segue.destination as? ProfileViewController else { return }
        destinationVC.firstname = firstnameTextField.text
        destinationVC.lastname = familyTextField.text
        destinationVC.image = photoImageView.image
        destinationVC.email = emailTextField.text
        destinationVC.password = passwordTextField.text
    }
    
}
    
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = image
        picker.dismiss(animated: true)
    }
}

