//
//  ProductViewController.swift
//  ecommerce
//
//  Created by Amar Amzari on 28/12/23.
//

import Foundation
import UIKit

protocol ProductViewControllerDelegate : AnyObject {
    
    func toCreateProduct()
    func presentLogoutPopUp()
    var products: [Product] { get set }
}

class ProductViewController: UIViewController, ProductViewControllerDelegate {
    var products: [Product] = .init()
    
    
    // MARK: Properties
    let backButtonImage = UIImage(systemName: "chevron.backward")
    let addButton = UIImage(systemName: "plus")
    
    let productView = ProductView()
    
    // MARK: Methods
    func toCreateProduct() {
        
        let CreateProductVC = CreateProductViewController { product in
            self.products.append(product)
            self.productView.collectionView.reloadData()
        }
//        let CreateProductVC = CreateProductViewController(1, "amar")
        
        self.navigationController?.pushViewController(CreateProductVC, animated: true)
    }
    
    func presentLogoutPopUp() {
        guard let nav = self.navigationController else {
            return
        }
        let LogOutVC = LogOutViewController(nav: nav)
        present(LogOutVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("JALAN VIEW WILL APPEAR")
//        self.productView.collectionView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loadAddButton()
    }
    
    
    override func loadView() {
        super.loadView()
        
        let backButton = UIButton(type: .system)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.setTitle("     Product", for: .normal)
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backButton.sizeToFit()
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: backButton)

        navigationItem.leftBarButtonItem = leftBarButton
        view.backgroundColor = .systemBackground
        
        productView.delegate = self
        view = productView
        
        
    }
    
    func loadAddButton(){
        
        guard products.count > 0 else { return }
        
        let buttonAdd = UIButton(type: .system)
        buttonAdd.setImage(addButton, for: .normal)
        buttonAdd.sizeToFit()
//        buttonAdd.backgroundColor = .tintColor
        buttonAdd.layer.cornerRadius = 2
        buttonAdd.addTarget(self, action: #selector(onTapRightButton), for: .touchUpInside)
        
        let rightBarButton = UIBarButtonItem(customView: buttonAdd)
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    @objc func onTapRightButton() {
        toCreateProduct()
    }
    
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
}
