//
//  VariantProductController.swift
//  ecommerce
//
//  Created by Amar Amzari on 06/01/24.
//

import Foundation
import UIKit

class VariantProductController : UIViewController {
    
    let backButtonImage = UIImage(systemName: "chevron.backward")
    
    override func loadView() {
        super.loadView()
        view = VariantProductView()
        view.backgroundColor = .systemBackground
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Add Product Variant 1", for: .normal)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.tintColor = .black
        backButton.sizeToFit()
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backButton.addTarget(self, action: #selector(BackButtonTapped), for: .touchUpInside)
        
        let leftBackBarButton = UIBarButtonItem(customView: backButton)
        
        navigationItem.leftBarButtonItem = leftBackBarButton
       
    }
    
    @objc func BackButtonTapped(){
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
