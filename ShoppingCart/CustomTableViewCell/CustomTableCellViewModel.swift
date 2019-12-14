//
//  CustomTableCellViewModel.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 11/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

class CustomTableCellViewModel {
    private let shop = Shop.shared
    private let cart = Cart.shared

    func addButtonPressed(id:Int) {
        cart.addItem(id:id)
    }
    
    func removeButtomPressed(id:Int){
        cart.removeItem(id:id)
    }
    
}
