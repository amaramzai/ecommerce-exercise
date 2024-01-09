//
//  RegisterView.swift
//  ecommerce
//
//  Created by Amar Amzari on 27/12/23.
//

import Foundation

import UIKit

class RegisterView: UIView {
    
    lazy var registerLabel:  UILabel = {
        
        let register = UILabel()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.font = .systemFont(ofSize: 30, weight: .bold)
        register.text = "Register"
        register.textColor = .tintColor
        
        return register
        
    }()
    
    
    lazy var nameLabel: UILabel = {
        
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Name"
        name.textColor = .black
        name.font = .systemFont(ofSize: 15, weight: .bold)
        
        return name
        
    }()
    
    
    lazy var nameTextField: UITextField = {
        
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect
        nameTextField.keyboardType = .namePhonePad
        nameTextField.textContentType = .name
        nameTextField.placeholder = "John Doe"
        
        return nameTextField
        
    }()
    
    lazy var emailLabel: UILabel = {
        
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.font = .systemFont(ofSize: 15, weight: .bold)
        email.text = "Email"
        email.textColor = .black
        
        return email
        
    }()
    
    lazy var emailTextField: UITextField = {
       
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        emailTextField.textContentType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholder = "johndoe@example.com"
        
        return emailTextField
        
    }()
    
    lazy var passwordLabel: UILabel = {
        
        let password = UILabel()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.font = .systemFont(ofSize: 15, weight: .bold)
        password.text = "Password"
        password.textColor = .black
        
        return password
        
    }()
    
    lazy var passwordTextField: UITextField = {
        
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "*******"
        passwordTextField.textContentType = .newPassword
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        
        return passwordTextField
        
    }()
    
    lazy var eyeButtonOpen: UIButton = {
        
        let eyeButtonOpen = UIButton(type: .system)
        eyeButtonOpen.translatesAutoresizingMaskIntoConstraints = false
        eyeButtonOpen.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButtonOpen.tintColor = .black
        eyeButtonOpen.addTarget(self, action: #selector(onEyeButtonTappedPassword), for: .touchUpInside)
        
        return eyeButtonOpen
        
    }()
    
    lazy var confirmLabel: UILabel = {
        
        let confirm = UILabel()
        confirm.translatesAutoresizingMaskIntoConstraints = false
        confirm.text = "Confirm Password"
        confirm.font = .systemFont(ofSize: 15, weight: .bold)
        confirm.textColor = .black
        
        return confirm
        
    }()
    
    lazy var eyeButtonSlashed: UIButton = {
        
        let eyeButtonSlash = UIButton(type: .system)
        eyeButtonSlash.translatesAutoresizingMaskIntoConstraints = false
        eyeButtonSlash.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButtonSlash.tintColor = .black
        eyeButtonSlash.addTarget(self, action: #selector(onEyeButtonTappedConfirm), for: .touchUpInside)
        
        return eyeButtonSlash
        
    }()
    
    lazy var confirmTextField: UITextField = {
        
        let confirmText = UITextField()
        confirmText.translatesAutoresizingMaskIntoConstraints = false
        confirmText.borderStyle = .roundedRect
        confirmText.placeholder = "*******"
        confirmText.textContentType = .newPassword
        confirmText.isSecureTextEntry = true
        confirmText.autocapitalizationType = .none
        
        return confirmText
        
    }()
    
    
    lazy var registerButton: UIButton = {
        
        let registers =  UIButton()
        registers.translatesAutoresizingMaskIntoConstraints = false
        registers.setTitle("REGISTER", for: .normal)
        registers.backgroundColor = .tintColor
        registers.addTarget(self, action: #selector(onEyeButtonTappedConfirm), for: .touchUpInside)
        
        return registers
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("haha error")
    }
 
    private func setupLayout(){
        
        addSubview(registerLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        passwordTextField.addSubview(eyeButtonOpen)
        passwordTextField.rightView = eyeButtonOpen
        passwordTextField.rightViewMode = .always
        addSubview(confirmLabel)
        addSubview(confirmTextField)
        confirmTextField.addSubview(eyeButtonSlashed)
        confirmTextField.rightView = eyeButtonSlashed
        confirmTextField.rightViewMode = .always
        addSubview(registerButton)
        
        NSLayoutConstraint.activate([
        
            registerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            registerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            eyeButtonOpen.heightAnchor.constraint(equalToConstant: 33),
            eyeButtonOpen.widthAnchor.constraint(equalToConstant: 53),
            
            confirmLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            confirmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            confirmTextField.topAnchor.constraint(equalTo: confirmLabel.bottomAnchor, constant: 10),
            confirmTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            confirmTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            confirmTextField.heightAnchor.constraint(equalToConstant: 50),
            
            eyeButtonSlashed.heightAnchor.constraint(equalToConstant: 33),
            eyeButtonSlashed.widthAnchor.constraint(equalToConstant: 53),
            
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc private func onEyeButtonTappedPassword(){
        passwordTextField.isSecureTextEntry.toggle()
        
        let eyeImageButton = passwordTextField.isSecureTextEntry ?  "eye.slash.fill" : "eye.fill"
        if let eyeImage = UIImage(systemName: eyeImageButton) {
            eyeButtonOpen.setImage(eyeImage, for: .normal)
        }
    }
    
    @objc private func onEyeButtonTappedConfirm(){
        confirmTextField.isSecureTextEntry.toggle()
        
        let eyeImageButton = confirmTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        if let eyeImage = UIImage(systemName: eyeImageButton) {
            eyeButtonSlashed.setImage(eyeImage, for: .normal)
        }
    }
    
    @objc func onRegisterButtonTapped() {
        
    }
    
}
