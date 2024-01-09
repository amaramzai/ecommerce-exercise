//
//  LogOutViewController.swift
//  ecommerce
//
//  Created by Amar Amzari on 30/12/23.
//

import Foundation
import UIKit

protocol LogOutDelegate: AnyObject {
    func onLogout()
    func onCancelLogout()
}

class LogOutViewController: UIViewController, LogOutDelegate {
    let logOutView = LogOutView()
    let nav: UINavigationController
    
    func onLogout() {
        dismiss(animated: false) {
//            self.nav.popToRootViewController(animated: true)
            self.nav.setViewControllers([ViewController(), LoginViewController()], animated: false)
        }
    }
    
    func onCancelLogout() {
        dismiss(animated: true)
    }
    
    init(nav: UINavigationController) {
        self.nav = nav
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        logOutView.delegate = self
        view = logOutView
        //view.backgroundColor = .systemBackground
    }
    
}
