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
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.isEnabled = false
        registerButton.alpha = 0.3
        
    }
    
    @IBAction func photoButtonTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let dvc = segue.destination as? ProfileViewController else { return }
        dvc.firstname = firstnameTextField.text
        dvc.lastname = lastnameTextField.text
        dvc.image = photoImageView.image
        
    }
    
    @IBAction func textFieldsChanged(_ sender: Any) {
        guard Validators.isFilled(firstname: firstnameTextField.text,
                                  lastname: lastnameTextField.text,
                                  email: emailTextField.text,
                                  password: passwordTextField.text) else {
                                    registerButton.isEnabled = false
                                    registerButton.alpha = 0.3
                                    return }
        
        guard Validators.isSimpleEmail(emailTextField.text!) else {
            registerButton.isEnabled = false
            registerButton.alpha = 0.3
            return }
        
        registerButton.isEnabled = true
        registerButton.alpha = 1
        
    }
    
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = image
        picker.dismiss(animated: true)
    }
}
