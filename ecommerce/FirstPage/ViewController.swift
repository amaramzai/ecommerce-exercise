//
//  ViewController.swift
//  ecommerce
//
//  Created by Amar Amzari on 26/12/23.
//

import UIKit

class ViewController: UIViewController, ButtonTappedDelegate {
    
    func buttonTapped(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    let viewOfPage = View()
    
    override func loadView() {
        super.loadView()
        viewOfPage.delegate = self
        view = viewOfPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

