//
//  CartViewModel.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 12/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

class CartViewModel{
    
    let cart = Cart.shared
    let shop = Shop.shared
    
    func getNumberOfRows() -> Int {
        return cart.getNumberOfItems()
    }
    
    func getCellData(id:Int) -> CartItem {
        guard let cartItem = cart.getCartItem(id: id) else {
            assertionFailure()
            return CartItem( id:-1, name:"NILL", price:-1 ,quantity:-1
            )
        }
        return cartItem
    }
}
