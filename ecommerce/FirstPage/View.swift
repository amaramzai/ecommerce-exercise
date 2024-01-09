//
//  View.swift
//  ecommerce
//
//  Created by Amar Amzari on 26/12/23.
//

import Foundation
import UIKit

class View: UIView {
   // weak var delegate: ViewControllerDelegate?
    weak var delegate : ButtonTappedDelegate?
    
    var images = UIImage(named: "Component 4_1.png")
    
    lazy var imageFront: UIImageView = {
        let imager = UIImageView(image: images)
        imager.translatesAutoresizingMaskIntoConstraints = false
        return imager
    }()
    
    lazy var loginButton: UIButton = {
        
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.backgroundColor = .tintColor
        loginButton.layer.cornerRadius = 20
        loginButton.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
        
        return loginButton
        
    }()
    
    lazy var registerButton: UIButton = {
        
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("REGISTER", for: .normal)
        register.backgroundColor = .tintColor
        register.layer.cornerRadius = 20
        register.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        
        return register
        
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
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(imageFront)
        addSubview(loginButton)
        addSubview(registerButton)
        addSubview(loginButton)
        addSubview(registerButton)
        
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            imageFront.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.6),
            imageFront.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6),
            imageFront.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            imageFront.centerYAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            
            loginButton.widthAnchor.constraint(equalToConstant: 350),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: imageFront.bottomAnchor, constant: 80),
            
            registerButton.widthAnchor.constraint(equalToConstant: 350),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25),
        ])
        
        
    }
    
    
    @objc func onLoginTapped() {
        delegate?.buttonTapped(viewController: LoginViewController() )
    }
    
    @objc func onRegisterTapped() {
        delegate?.buttonTapped(viewController: RegisterViewController())
    }
}
