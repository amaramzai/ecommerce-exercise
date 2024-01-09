//
//  CreateProductView.swift
//  ecommerce
//
//  Created by Amar Amzari on 30/12/23.
//

import Foundation
import UIKit


class CreateProductView: UIView , UITextFieldDelegate {
    
    weak var delegateForButton : ButtonTappedDelegate?
    
    weak var delegate: CreateProductDelegate?
    
    lazy var nameLabel: UILabel = {
        let names = UILabel()
        names.translatesAutoresizingMaskIntoConstraints = false
        names.font = UIFont.boldSystemFont(ofSize: 15)
        names.text = "Name"
        names.textColor = .black
        return names
    }()
    
    lazy var nameTextField: UITextField = {
        
        let nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "Product Name"
        nameTextField.keyboardType = .default
        nameTextField.textContentType = .name
        nameTextField.autocapitalizationType = .none
        
        return nameTextField
        
    }()
    
    lazy var descriptionLabel : UILabel = {
        
        let descLabel = UILabel()
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.font = UIFont.boldSystemFont(ofSize: 15)
        descLabel.text = "Description"
        descLabel.textColor = .black
        
        return descLabel
        
    }()
    
    lazy var descriptionTextField : UITextField = {
        
        let descField = UITextField()
        descField.translatesAutoresizingMaskIntoConstraints = false
        descField.contentMode = .topLeft
        descField.placeholder = "description product"
        descField.borderStyle = .roundedRect
        descField.keyboardType = .default
        descField.autocapitalizationType = .none
        
        return descField
        
    }()
    
    lazy var productVariantLabel : UILabel = {
        
        let productVar = UILabel()
        productVar.translatesAutoresizingMaskIntoConstraints = false
        productVar.text = "Varian Product"
        productVar.textColor = .black
        productVar.font = UIFont.boldSystemFont(ofSize: 15)
        
        return productVar
        
    }()
    
    lazy var addProductVarOne : UIButton = {
        
        let VarOne = UIButton(type: .system)
        VarOne.translatesAutoresizingMaskIntoConstraints = false
        VarOne.setTitle("Add Varian product 1", for: .normal)
        VarOne.setTitleColor(.tintColor, for: .normal)
        VarOne.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        VarOne.layer.borderWidth = 2
        VarOne.layer.borderColor = UIColor.tintColor.cgColor
        VarOne.backgroundColor = .clear
        VarOne.layer.cornerRadius = 10
        VarOne.addTarget(self, action: #selector(toVarOne), for: .touchUpInside)
        
        return VarOne
        
    }()
    
    lazy var addProductVarTwo : UIButton = {
        
        let VarTwo = UIButton(type: .system)
        VarTwo.translatesAutoresizingMaskIntoConstraints = false
        VarTwo.setTitle("Add Varian product 2", for: .normal)
        VarTwo.setTitleColor(.tintColor, for: .normal)
        VarTwo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        VarTwo.layer.borderWidth = 2
        VarTwo.layer.borderColor = UIColor.tintColor.cgColor
        VarTwo.backgroundColor = .clear
        VarTwo.layer.cornerRadius = 10
        VarTwo.addTarget(self, action: #selector(toVarTwo), for: .touchUpInside)
        
        return VarTwo
        
    }()
    
    lazy var addProductVarThree : UIButton = {
        
        let VarThree = UIButton(type: .system)
        VarThree.translatesAutoresizingMaskIntoConstraints = false
        VarThree.setTitle("Add Varian product 2", for: .normal)
        VarThree.setTitleColor(.tintColor, for: .normal)
        VarThree.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        VarThree.layer.borderWidth = 2
        VarThree.layer.borderColor = UIColor.tintColor.cgColor
        VarThree.backgroundColor = .clear
        VarThree.layer.cornerRadius = 10
        VarThree.addTarget(self, action: #selector(toVarThree), for: .touchUpInside)
        
        return VarThree
        
    }()
    
    lazy var saveButton : UIButton = {
        
        let saveBtn = UIButton(type: .system)
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        saveBtn.backgroundColor = .tintColor
        saveBtn.addTarget(self, action: #selector(onSubmit), for: .touchUpInside)
        
        return saveBtn
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        nameTextField.delegate = self
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("hehe gagal")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        return true
    }
    
    //func textFieldDidEndEditing(_ textField: UITextField) {}
    
    private func setupLayout(){
        
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(descriptionLabel)
        addSubview(descriptionTextField)
        addSubview(productVariantLabel)
        addSubview(addProductVarOne)
        addSubview(addProductVarTwo)
        addSubview(addProductVarThree)
        addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 100),
            
            productVariantLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 15),
            productVariantLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            addProductVarOne.topAnchor.constraint(equalTo: productVariantLabel.bottomAnchor, constant: 10),
            addProductVarOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addProductVarOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addProductVarOne.heightAnchor.constraint(equalToConstant: 50),
            
            addProductVarTwo.topAnchor.constraint(equalTo: addProductVarOne.bottomAnchor, constant: 15),
            addProductVarTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addProductVarTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addProductVarTwo.heightAnchor.constraint(equalToConstant: 50),
            
            addProductVarThree.topAnchor.constraint(equalTo: addProductVarTwo.bottomAnchor, constant: 15),
            addProductVarThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            addProductVarThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addProductVarThree.heightAnchor.constraint(equalToConstant: 50),
            
            
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func onSubmit() {
        guard let productName = nameTextField.text else {
            return
        }
        
        let product: Product = .init(name: productName, variant: 1, stock: 1, price: 1)
        
        nameTextField.text = ""
        delegate?.goBack(product: product)
    }
    
    
    
    @objc func toVarOne(){
        delegateForButton?.buttonTapped(viewController: VariantProductController())
    }
    
    @objc func toVarTwo(){
        
        
    }
    
    @objc func toVarThree(){
        
        
    }

}
