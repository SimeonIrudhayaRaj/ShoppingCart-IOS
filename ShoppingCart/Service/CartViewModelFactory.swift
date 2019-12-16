//
//  CartViewModelFactory.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 16/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//
class CartViewModelFactory {
    static func createInstance() -> CartViewModel {
        let shopService: ShopService = Shop()
        let cartService: CartService = Cart.shared
        
        return CartViewModel(
            shop: shopService,
            cart: cartService
        )
    }
}

