//
//  ProductView.swift
//  ecommerce
//
//  Created by Amar Amzari on 28/12/23.
//

import Foundation
import UIKit

class ProductView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: ProductViewControllerDelegate?
    
//    var products: [Product] = .init()
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), collectionViewLayout: layout)
        
//        let itemsPerRow: CGFloat = 2
//        let padding: CGFloat = 1
//        
//        var screenWidth = UIScreen.main.bounds.width
//        
//        let availableWidth = CGFloat(screenWidth) - (itemsPerRow + 5) * padding
//        let itemWidth = availableWidth / itemsPerRow
//        
//        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        //If you set it false, you have to add constraints.
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "HeaderCell")
        cv.backgroundColor = .yellow
        

        return cv
    }()
    
    lazy var addProductButtonUp: UIButton = {
        
        let addBtnUp = UIButton(type: .system)
        addBtnUp.translatesAutoresizingMaskIntoConstraints = false
        addBtnUp.backgroundColor = .systemBlue
        addBtnUp.setTitle("plus", for: .normal)
        addBtnUp.layer.cornerRadius = 5
        addBtnUp.addTarget(self, action: #selector(CreateProductTapped), for: .touchUpInside)
        
        return addBtnUp
        
    }()
    
    lazy var addProductButton: UIButton = {
        let addProductButton = UIButton(type: .system)
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        addProductButton.addTarget(self, action: #selector(CreateProductTapped), for: .touchUpInside)
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 50)
        let image = UIImage(systemName: "plus.circle", withConfiguration: imageConfig )
        
        let plusIcon = UIImageView(image: image)
        plusIcon.tintColor = .systemBlue
        plusIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        let addProductLabels = UILabel()
        addProductLabels.translatesAutoresizingMaskIntoConstraints = false
        addProductLabels.font = .systemFont(ofSize: 20, weight: .bold)
        addProductLabels.text = "Add Product"
        addProductLabels.textColor = .systemBlue
        
        addProductButton.addSubview(plusIcon)
        addProductButton.addSubview(addProductLabels)
        
        NSLayoutConstraint.activate([
            plusIcon.centerYAnchor.constraint(equalTo: addProductButton.centerYAnchor, constant: -20),
            plusIcon.centerXAnchor.constraint(equalTo: addProductButton.centerXAnchor),
            addProductLabels.centerXAnchor.constraint(equalTo: addProductButton.centerXAnchor),
            addProductLabels.topAnchor.constraint(equalTo: plusIcon.bottomAnchor, constant: 10),
        ])
        
        return addProductButton
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let products = delegate?.products else {return 0}
        if products.count > 0 {
            addProductButton.removeFromSuperview()
           
            return products.count
        }
        
        self.collectionView.addSubview(addProductButton)
        
        NSLayoutConstraint.activate([
            addProductButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addProductButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addProductButton.heightAnchor.constraint(equalToConstant: 100),
            addProductButton.widthAnchor.constraint(equalToConstant: 120),
        ])
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)
        cell.backgroundColor = .cyan
        
        guard let products = delegate?.products else {return cell}
        
        let productNameUILabel = UILabel()
        productNameUILabel.translatesAutoresizingMaskIntoConstraints = false
        productNameUILabel.font = .systemFont(ofSize: 15, weight: .bold)
        productNameUILabel.text = products[indexPath.item].name
        productNameUILabel.textColor = .black
        
        let buttonProduct = UIButton(type: .system)
        buttonProduct.translatesAutoresizingMaskIntoConstraints = false
        buttonProduct.backgroundColor = UIColor(red: 3, green: 3, blue: 1, alpha: 0)
        buttonProduct.addTarget(self, action: #selector(PrintSmth), for: .touchUpInside)
        
        let productVariant = UILabel()
        productVariant.translatesAutoresizingMaskIntoConstraints = false
        productVariant.font = .systemFont(ofSize: 10, weight: .bold)
        productVariant.text = "\(products[indexPath.item].stock)"
        productVariant.textColor = .black
        
        cell.addSubview(productNameUILabel)
        cell.addSubview(buttonProduct)
        
        NSLayoutConstraint.activate([
            
            productNameUILabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            productNameUILabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 15),
            
            buttonProduct.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            buttonProduct.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
            buttonProduct.widthAnchor.constraint(equalTo: cell.widthAnchor),
            buttonProduct.heightAnchor.constraint(equalTo: cell.heightAnchor)
        ])
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let layoutViewWidth = collectionView.frame.width
        let itemSizeInARow = 2.0
        let padding = 10.0
        
        let availableWidth = CGFloat(layoutViewWidth) - (itemSizeInARow) * padding
        let itemWidth = availableWidth / itemSizeInARow
        
        let cellSize = CGSize(width: itemWidth, height: 300)
        print(cellSize)
        
        return cellSize
    }
    
    lazy var searchTextField: UITextField = {
        let search = UITextField()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.borderStyle = .roundedRect
        search.placeholder = "Search"
        search.autocapitalizationType = .none
        
        return search
        
    }()
    
    lazy var searchSymbol: UIButton = {
        
        let searchSym = UIButton(type: .system)
        searchSym.translatesAutoresizingMaskIntoConstraints = false
        searchSym.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchSym.tintColor = .black
        
        return searchSym
        
    }()
    
    lazy var logOutBG: UIView = {
        
        let logOutRect = UIView()
        logOutRect.translatesAutoresizingMaskIntoConstraints = false
        logOutRect.backgroundColor = .tintColor
        logOutRect.layer.cornerRadius = 20
        
        return logOutRect
        
    }()
    
    lazy var logOuButton: UIButton = {
        
        let logOutButton = UIButton(type: .system)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        let logOutImage = UIImage(systemName: "rectangle.portrait.and.arrow.right")
        logOutButton.setImage(logOutImage, for: .normal)
        logOutButton.tintColor = .white
        logOutButton.addTarget(self, action: #selector(LogOutButtonTapped), for: .touchUpInside)
        
        return logOutButton
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("hehe gagal")
    }
    
    private func setupLayout(){
        addSubview(collectionView)
        addSubview(searchTextField)

        searchTextField.addSubview(searchSymbol)
        searchTextField.leftView = searchSymbol
        searchTextField.leftViewMode = .always
        
        addSubview(logOutBG)
        addSubview(logOuButton)
       
        NSLayoutConstraint.activate([
        
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            searchSymbol.heightAnchor.constraint(equalToConstant: 30),
            searchSymbol.widthAnchor.constraint(equalToConstant: 30),
            
            logOutBG.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logOutBG.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            logOutBG.heightAnchor.constraint(equalToConstant: 40),
            logOutBG.widthAnchor.constraint(equalToConstant: 40),
            
            logOuButton.centerXAnchor.constraint(equalTo: logOutBG.centerXAnchor),
            logOuButton.centerYAnchor.constraint(equalTo: logOutBG.centerYAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    @objc func PrintSmth(){
        
        print ("ahiw")
        
    }
    
    @objc func CreateProductTapped(){
        guard let delegate = self.delegate else {
            return
        }
        print ("ahiw")
        delegate.toCreateProduct()
    }
    
    @objc func LogOutButtonTapped(){
        guard let delegate = self.delegate else {
            return
        }
        delegate.presentLogoutPopUp()
    }
    
}
