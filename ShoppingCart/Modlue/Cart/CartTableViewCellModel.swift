//
//  CartTableViewCellModel.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 12/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

class CartTableViewCellModel {
    private let shop = Shop.shared
    private let cart = Cart.shared
    func plusButtonPressed(id:Int){
        let cartItem = cart.getCartItem(id: id)
        cart.addItem(id: id)
    }
    
    
    func minusButtonPressed(id:Int){
        cart.removeItem(id: id)
    }
}
