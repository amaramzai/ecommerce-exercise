//
//  LoginView.swift
//  ecommerce
//
//  Created by Amar Amzari on 26/12/23.
//

import UIKit


class LoginView: UIView {
    
    weak var delegate: ButtonTappedDelegate?
    
    lazy var loginLabel: UILabel = {
        
        let loginLabels = UILabel()
        loginLabels.font = .systemFont(ofSize: 30, weight: .bold)
        loginLabels.translatesAutoresizingMaskIntoConstraints = false
        loginLabels.text = "Login"
        loginLabels.textColor = .tintColor
        
        return loginLabels
        
    }()
    
    lazy var emailLabel: UILabel = {
        let emailLabels = UILabel()
        emailLabels.translatesAutoresizingMaskIntoConstraints = false
        emailLabels.font = .systemFont(ofSize: 15, weight: .bold)
        emailLabels.text = "Email"
        emailLabels.textColor = .black
        
        return emailLabels
    }()
    
    lazy var emailTextField: UITextField = {
        
        let textFields = UITextField()
        textFields.placeholder = "johndoe@example.com"
        textFields.translatesAutoresizingMaskIntoConstraints = false
        textFields.borderStyle = .roundedRect
        textFields.textContentType = .emailAddress
        textFields.keyboardType = .emailAddress
        textFields.autocapitalizationType = .none
        
        return textFields
    }()
    
    lazy var passwordLabel: UILabel = {
        
        let passwordLabels = UILabel()
        passwordLabels.translatesAutoresizingMaskIntoConstraints = false
        passwordLabels.font = .systemFont(ofSize: 15, weight: .bold)
        passwordLabels.text = "Password"
        passwordLabels.textColor = .black
        
        return passwordLabels
        
    }()
    
    lazy var eyeButton: UIButton = {
        
        var eyeButtons = UIButton(type: .system)
        eyeButtons.translatesAutoresizingMaskIntoConstraints = false
        eyeButtons.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        eyeButtons.tintColor = .black
        
        eyeButtons.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        
        return eyeButtons
        
    }()
    
    lazy var passwordTextField: UITextField = {
        
        let passwordText = UITextField()
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.borderStyle = .roundedRect
        passwordText.isSecureTextEntry = true
        passwordText.textContentType = .newPassword
        passwordText.autocapitalizationType = .none
        passwordText.placeholder = "***********"
        
        return passwordText
        
    }()
    
    
    lazy var loginButtonDown: UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = .tintColor
        button.addTarget(self, action: #selector(onLoginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("hehe gagal")
    }
    
    
    private func setupLayout(){
        
        addSubview(loginLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        passwordTextField.addSubview(eyeButton)
        passwordTextField.rightView = eyeButton
        passwordTextField.rightViewMode = .always
        addSubview(loginButtonDown)
        
        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 35),
            
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            eyeButton.heightAnchor.constraint(equalToConstant: 33),
            eyeButton.widthAnchor.constraint(equalToConstant: 53),
            
            loginButtonDown.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            loginButtonDown.leadingAnchor.constraint(equalTo: leadingAnchor),
            loginButtonDown.trailingAnchor.constraint(equalTo: trailingAnchor),
            loginButtonDown.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
   @objc private func eyeButtonTapped(){
       passwordTextField.isSecureTextEntry.toggle()
       
       let eyeImageName = passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
       if let eyeImage = UIImage(systemName: eyeImageName){
           eyeButton.setImage(eyeImage, for: .normal)
       }
    }
    
    @objc func onLoginButtonTapped(){
        guard let delegate = self.delegate else {
            return
        }
        
        delegate.buttonTapped(viewController: ProductViewController())
        
    }
    
    
}
