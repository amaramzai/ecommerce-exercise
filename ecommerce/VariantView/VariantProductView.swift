//
//  VariantProductView.swift
//  ecommerce
//
//  Created by Amar Amzari on 06/01/24.
//

import Foundation
import UIKit


class VariantProductView: UIView {
    
    //var priceLabelViewHeight : CGFloat
    let imageButtons = UIImage(named:  "Component 7_1.png")
    
    lazy var buttonContainer : UIView = {
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemBackground
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOffset = CGSize.zero
        container.layer.shadowRadius = layer.shadowRadius
        container.layer.shadowRadius = 8
        container.layer.cornerRadius = layer.cornerRadius
        container.layer.shadowOpacity = 0.5
        container.clipsToBounds = false
        return container
        
    }()
    
    lazy var imagePhoto : UIImageView = {
        
        let image = UIImage(named: "Component 7_1.png")
        let photoImage = UIImageView(image: image)
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        
        return photoImage
        
    }()
    
    lazy var imageButton : UIButton = {

        let imageBtn = UIButton(type: .system)
        imageBtn.translatesAutoresizingMaskIntoConstraints = false
        imageBtn.backgroundColor = .white
        imageBtn.addTarget(self, action: #selector(printSomething), for: .touchUpInside)

        
        return imageBtn
        
    }()
    
    lazy var variantNameLabel : UILabel = {
        
        let variantName = UILabel()
        variantName.translatesAutoresizingMaskIntoConstraints = false
        variantName.font = .systemFont(ofSize: 15, weight: .bold)
        variantName.text = "Variant Name"
        variantName.textColor = .black
        
        return variantName
        
    }()
    
    lazy var variantTextField : UITextField = {
        
        let variantTxtField = UITextField()
        variantTxtField.translatesAutoresizingMaskIntoConstraints = false
        variantTxtField.borderStyle = .roundedRect
        variantTxtField.placeholder = "variant product name"
        variantTxtField.layer.borderColor = UIColor.black.cgColor
        variantTxtField.keyboardType = .default
        variantTxtField.autocapitalizationType = .none
        
        return variantTxtField
        
    }()
    
    lazy var priceLabel : UILabel = {
        
        let priceLbl = UILabel()
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        priceLbl.font = .systemFont(ofSize: 15, weight: .bold)
        priceLbl.text = "Harga"
        priceLbl.textColor = .black
        
        return priceLbl
        
    }()
    
    lazy var priceCurrencyLabel : UILabel = {
        
        let priceCurrLabel = UILabel()
        priceCurrLabel.translatesAutoresizingMaskIntoConstraints = false
        priceCurrLabel.text = "Rp"
        priceCurrLabel.textColor = .black
        priceCurrLabel.textAlignment = .center
        priceCurrLabel.font = .systemFont(ofSize: 20, weight: .bold)
        priceCurrLabel.backgroundColor = .red
        
        return priceCurrLabel
        
    }()
    
    
    lazy var priceCurrencyView : UIView = {
        
        let priceCurr = UIView()
        priceCurr.translatesAutoresizingMaskIntoConstraints = false
        priceCurr.backgroundColor = .lightGray
        //priceCurr.layer.cornerRadius = 10
        return priceCurr
        
    }()
    
    lazy var priceTextField : UITextField = {
        
        let priceTxtField = UITextField()
        priceTxtField.translatesAutoresizingMaskIntoConstraints = false
        priceTxtField.borderStyle = .roundedRect
        priceTxtField.layer.borderColor = UIColor.black.cgColor
        //priceTxtField.layer.borderWidth = 0
        priceTxtField.layer.cornerRadius = 2
        priceTxtField.clipsToBounds = true
     
        priceTxtField.placeholder = "0"
       
        
        return priceTxtField
        
    }()
    
    lazy var stockLabel : UILabel = {
        
        let stockLbl = UILabel()
        stockLbl.translatesAutoresizingMaskIntoConstraints = false
        stockLbl.textColor = .black
        stockLbl.font = .systemFont(ofSize: 15, weight: .bold)
        
        return stockLbl
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            // Print the height of priceCurrencyView
            print("priceCurrencyView height: \(self.priceCurrencyView.frame.size.height)")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("yiha")
    }
    
    func setupLayout(){
        addSubview(buttonContainer)
        buttonContainer.addSubview(imageButton)
        imageButton.addSubview(imagePhoto)
        
        addSubview(variantNameLabel)
        addSubview(variantTextField)
        addSubview(priceLabel)
        addSubview(priceTextField)
        priceTextField.addSubview(priceCurrencyView)
        priceTextField.leftView = priceCurrencyView
        priceTextField.leftViewMode = .always
        //addSubview(priceCurrencyLabel)
        priceCurrencyView.addSubview(priceCurrencyLabel)
        //priceCurrencyView.layoutIfNeeded()
        
        NSLayoutConstraint.activate([
        
            buttonContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            buttonContainer.heightAnchor.constraint(equalToConstant: 200),
            buttonContainer.widthAnchor.constraint(equalToConstant: 200),

            imageButton.centerXAnchor.constraint(equalTo: buttonContainer.centerXAnchor),
            imageButton.centerYAnchor.constraint(equalTo: buttonContainer.centerYAnchor),
            imageButton.heightAnchor.constraint(equalToConstant: 200),
            imageButton.widthAnchor.constraint(equalToConstant: 200),
            
            
            imagePhoto.centerXAnchor.constraint(equalTo: imageButton.centerXAnchor),
            imagePhoto.centerYAnchor.constraint(equalTo: imageButton.centerYAnchor),
            imagePhoto.heightAnchor.constraint(equalToConstant: 50),
            imagePhoto.widthAnchor.constraint(equalToConstant: 50 ),
            
            variantNameLabel.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant:
                                                     50),
            variantNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            variantTextField.topAnchor.constraint(equalTo: variantNameLabel.bottomAnchor, constant: 20),
            variantTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            variantTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            variantTextField.heightAnchor.constraint(equalToConstant: 50),
            
            priceLabel.topAnchor.constraint(equalTo: variantTextField.bottomAnchor, constant: 30),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            priceTextField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            priceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            priceTextField.heightAnchor.constraint(equalToConstant: 50),
            
            priceCurrencyView.leadingAnchor.constraint(equalTo: priceTextField.leadingAnchor),
            priceCurrencyView.widthAnchor.constraint(equalToConstant: 50),
            
            priceCurrencyLabel.centerYAnchor.constraint(equalTo: priceTextField.centerYAnchor),
            priceCurrencyLabel.centerXAnchor.constraint(equalTo: priceCurrencyView.centerXAnchor)

            
        ])
        
        //NYOBAIN GIT
        
       
    }
    
    @objc func printSomething(){
        
        print("jajajajas")
        
    }
    
}
