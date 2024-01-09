//
//  ProductListModel.swift
//  ecommerce
//
//  Created by Amar Amzari on 01/01/24.
//

import Foundation

import UIKit

struct Product: Identifiable {
    let id = UUID().uuidString
    var name: String
    var variant: Int
    var stock: Int
    var price: Int
//    var image: UIImage
    
}

struct AddButton {

    var imageName : String
    
}
