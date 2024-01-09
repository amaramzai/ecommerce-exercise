//
//  RegisterViewController.swift
//  ecommerce
//
//  Created by Amar Amzari on 26/12/23.
//

import UIKit

class RegisterViewController: UIViewController{
    
    
    let navIcon = UIImage(systemName: "chevron.backward")
    
    override func loadView() {
        super.loadView()
        
        let backButton = UIBarButtonItem(image: navIcon, style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        
        view = RegisterView()
        
        view.backgroundColor = .systemBackground
//        title = "Register View"
//        view.backgroundColor = .blue
//        
//        let backButton = UIButton(type: .system)
//        backButton.setTitle("Back", for: .normal)
//        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        
//        view.addSubview(backButton)
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
        
}
    
