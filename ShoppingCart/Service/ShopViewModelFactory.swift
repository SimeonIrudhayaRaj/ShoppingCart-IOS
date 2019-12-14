//
//  ShopViewModelFactory.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 13/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

class ShopViewModelFactory {
    static func createInstance() -> ShopViewModel {
        let shopService: ShopService = Shop()
        let cartService: CartService = Cart()
        
        return ShopViewModel(
            shop: shopService,
            cart: cartService
        )
    }
}
