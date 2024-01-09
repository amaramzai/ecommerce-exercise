//
//  CreateProductViewController.swift
//  ecommerce
//
//  Created by Amar Amzari on 30/12/23.
//

import Foundation
import UIKit

protocol CreateProductDelegate: AnyObject {
    func goBack(product: Product)
}

class CreateProductViewController: UIViewController, CreateProductDelegate, ButtonTappedDelegate {
  
    
    
    var onSubmit: (_ product: Product) -> Void
    
    init(onSubmit: @escaping (_ product: Product) -> Void) {
        self.onSubmit = onSubmit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func goBack(product: Product) {
        onSubmit(product)
        self.navigationController?.popViewController(animated: true)
    }
    
    let backButtonImage = UIImage(systemName: "chevron.backward")
    
    override func loadView() {
        super.loadView()
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Create Product", for: .normal)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.tintColor = .black
        backButton.sizeToFit()
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backButton.addTarget(self, action: #selector(BackButtonTapped), for: .touchUpInside)
        
        let leftBackBarButton = UIBarButtonItem(customView: backButton)
        
        navigationItem.leftBarButtonItem = leftBackBarButton
        
        let productView = CreateProductView()
        
        productView.delegate = self
        productView.delegateForButton = self
        
        view = productView
        
    }
    
    func buttonTapped(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func BackButtonTapped(){
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
