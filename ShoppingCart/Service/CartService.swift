//
//  CartService.swift
//  ShoppingCart
//
//  Created by Simeon Irudhaya Raj J on 13/12/19.
//  Copyright © 2019 Simeon Irudhaya Raj J. All rights reserved.
//

protocol CartService: class {
    func setObserver(_ observer: CartObserver?)
    func addItem(id: Int)
    func removeItem(id: Int)
    func getQuantityOfItem(id: Int) -> Int
    func getTotalQuantity() -> Int
    func getNumberOfItems() -> Int
    func getCartItem(id: Int) -> CartItem?
    func getCartItems() -> [CartItem]
    func getTotalCost() -> Int
}
