//
//  LoginViewController.swift
//  ecommerce
//
//  Created by Amar Amzari on 26/12/23.
//

import UIKit

protocol LoginViewControllerDelegate : AnyObject {
    func toProductList()
}

class LoginViewController: UIViewController, ButtonTappedDelegate {
    
    let loginView = LoginView()
    
    func buttonTapped(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    let navIcon = UIImage(systemName: "chevron.backward")
    
    override func loadView() {
        super.loadView()
       
        let barButton = UIBarButtonItem(image: navIcon, style: .done, target: self, action: #selector(backButtonTapped))
        barButton.tintColor = .black
        navigationItem.leftBarButtonItem = barButton
        loginView.delegate = self
        view = loginView
           
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
